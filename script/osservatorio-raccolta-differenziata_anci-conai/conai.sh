#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

nome="osservatorio-raccolta-differenziata_anci-conai"

mkdir -p "$folder"/../../dati/"$nome"

# estrai i codici rifiuti riportati sul sito
curl -kL "https://www.osservatorioraccoltadifferenziata.it/datisearch2_new.php?regione=13&provincia=&comune=0&anno=2020" |
  scrape -be '//div[@class="modal-content"]//ul/li' |
  xq -r '.html.body.li[]' |
  mlr --t2c --implicit-csv-header nest --explode --pairs --across-fields -f 1 then \
    reshape -r '.' -o k,v then \
    clean-whitespace then \
    nest --explode --values --across-records --nested-fs "," -f v then \
    clean-whitespace then \
    filter '!is_null($v)' then label tipologia,CodiceCER >"$folder"/../../dati/"$nome"/codici.csv

# estrai header tabella dati
label=$(curl -kL "https://www.osservatorioraccoltadifferenziata.it/datisearch2_new.php?regione=13&provincia=&comune=0&anno=2020" | scrape -be '//thead//th' | xq -cr '.html.body.th|@csv' | mlr --csv -N cat)

# if file exists, delete it
if [ -f "$folder"/../../dati/"$nome"/dati-raccolta_differenziata.csv ]; then
  rm "$folder"/../../dati/"$nome"/dati-raccolta_differenziata.csv
fi

# scarica i dati
for i in {01..20}; do
  curl -kL "https://www.osservatorioraccoltadifferenziata.it/datisearch2_new.php?regione=$i&provincia=&comune=0&anno=2020" |
    scrape -be '//tbody/tr' |
    xq -c '.html.body.tr[].td' |
    sed -r 's/(\[|\])//g' >>"$folder"/../../dati/"$nome"/dati-raccolta_differenziata.csv
done

# aggiungi etichetta ai dati
mlr -I --csv --implicit-csv-header label "$label" "$folder"/../../dati/"$nome"/dati-raccolta_differenziata.csv

# fai join tra dati e anagrafica codici
mlr --csv join --ul -j CodiceCER -f "$folder"/../../dati/"$nome"/dati-raccolta_differenziata.csv then unsparsify "$folder"/../../dati/"$nome"/codici.csv >"$folder"/tmp.csv

# rimuovi il separatore delle migliaia e sostituisci come separatore decimale la virgola con il punto
mlr -I --csv put -S '${Raccolto (t)}=gsub(${Raccolto (t)},"\.","");${Raccolto (t)}=sub(${Raccolto (t)},",",".");$Abitanti=gsub($Abitanti,"\.","")' then reorder -e -f CodiceCER then sort -f Regione,Comune -n CodiceCER "$folder"/tmp.csv

mv "$folder"/tmp.csv "$folder"/../../dati/"$nome"/dati-raccolta_differenziata.csv
