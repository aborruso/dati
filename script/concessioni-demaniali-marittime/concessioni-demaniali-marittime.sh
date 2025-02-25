#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

nome="concessioni-demaniali-marittime"

mkdir -p "$folder"/../../dati/"$nome"

mkdir -p "$folder"/tmp

dataURL="https://dati.mit.gov.it/catalog/dataset/dafc8e4d-924f-4bbc-b670-ec8c34b5c867/resource/e475d004-72bb-4a2b-bee9-3ba6f4fd0e74/download/conconcessioni.zip"

if [ ! -f "$folder"/tmp/conconcessioni.zip ]; then
  curl -kL "$dataURL" -o "$folder"/tmp/conconcessioni.zip
fi

cd "$folder"/tmp

if [ -f "$folder"/tmp/conconcessioni.zip ]; then
  unzip -o "$folder"/tmp/conconcessioni.zip
fi

ogr2ogr -overwrite -a_srs EPSG:3004 "$folder"/../../dati/"$nome"/conconcessioni.shp conconcessioni.shp

cd "$folder"

if [ -f "$folder"/../../dati/"$nome"/conconcessioni.zip ]; then
  rm "$folder"/../../dati/"$nome"/conconcessioni.zip
fi

zip -r -7 "$folder"/../../dati/"$nome"/conconcessioni.zip "$folder"/../../dati/"$nome"/conconcessioni.*

URL_csv="https://dati.mit.gov.it/catalog/dataset/dafc8e4d-924f-4bbc-b670-ec8c34b5c867/resource/5c368853-0890-489d-901d-76846aa1947e/download/concessionietrf.csv"

if [ ! -f "$folder"/tmp/concessionietrf.csv ]; then
  curl -kL "$URL_csv" -o "$folder"/tmp/concessionietrf.csv
fi

mlr --csv put -S 'for (k in $*) {$[k] = gsub($[k], "inf", "")}' "$folder"/tmp/concessionietrf.csv >"$folder"/../../dati/"$nome"/concessionietrf.csv

find "$folder"/../../dati/"$nome" -type f -not -name "*.zip" -and -not -name "README.md" -and -not -name "*.csv" -delete

find "$folder"/tmp -type f -delete
