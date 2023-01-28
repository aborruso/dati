# Introduzione

> La Banca Dati ANCI CONAI e l’Osservatorio Enti Locali sono due specifici strumenti introdotti dall’Accordo Quadro che hanno sostanzialmente lo scopo di raccogliere i principali dati relativi alla gestione dei rifiuti urbani nei Comuni Italiani, garantendo una base di dati utile a successive elaborazioni, la prima delle quali è la messa a disposizione dei Comuni stessi di informazioni preziose per monitorare i propri standard di efficacia.

fonte: <https://www.conai.org/regioni-ed-enti-locali/sostegno-alla-raccolta-e-al-riciclo/banca-data-anci-conai-osservatorio/>

È stato istituito un **Osservatorio degli Enti Locali sulla Raccolta Differenziata** e il relativo [sito](https://www.osservatorioraccoltadifferenziata.it/).

Abbiamo estratto da questo, i dati della [sezione "Dati Raccolta Differenziata"](https://www.osservatorioraccoltadifferenziata.it/cercadati_new.php).

# Note sui dati esposti qui

- Nel sito di origine i dati sono disponibili al download, regione per regione. Abbiamo creato un unico file;
- nei file scaricabili dal sito di origine è inserito il codice `CER` (Catalogo Europeo dei Rifiuti), ma non è presente una tabella con il significato dei codici, ma un testo descrittivo. Abbiamo estratto i codici descritti nel sito e creato [una tabella](codici.csv) con le relative descrizioni;
- nei file scaricabili dal sito di origine, i valori di popolazione contengono il separatore delle migliaia. È stato rimosso (da `1.453` a `1453`);
- nei file scaricabili dal sito di origine, i valori sulle tonnellate di rifiuti raccolte hanno la virgola come separatore di decimali. È stata sostituita dal `.` (da `6,31` a `6.31`);
- sono dati relativi all'anno 2020

Il file di output:

-  è [`dati-raccolta_differenziata.csv`](dati-raccolta_differenziata.csv);
-  formato `CSV`;
-  la `,` è il separatore di campo;
-  il _character encoding_ è `UTF-8`.

# Note presenti nel sito di origine

> È possibile consultare i dati relativi ai quantitativi di rifiuti urbani raccolti dai gestori > dei servizi comunali per singolo CER (codice identificativo rifiuti), al Comune e alla > popolazione interessata dalla raccolta.
> I dati esposti sono stati rilevati da ANCI attraverso le seguenti fonti informative:
>
> -   le Regioni e le Province Autonome, che hanno trasmesso i dati annuali dei rifiuti urbani > raccolti, classificati per CER;
> -   il Catasto Nazionale Rifiuti di ISPRA, utilizzato per coprire i vuoti informativi dei > dati trasmessi dalle Regioni.
>
> ANCI ha provveduto successivamente ad elaborare ed uniformare i dati pervenuti, con > particolare riferimento a:
>
> -   per alcune tipologie di rifiuti (ingombranti a recupero, spazzamento a recupero, > autocompostaggio), come da notazione ISPRA, sono stati utilizzati codici non previsti nel DM > 26 maggio 2016 (rispettivamente 20030\_ è il CER assegnato alla raccolta degli ingombranti a > recupero, 200380 è il CER assegnato allo spazzamento a recupero, 200109 è il CER assegnato > all'autocompostaggio);
> -   per la raccolta multimateriale sono considerate all'interno del codice 150106 tutte le > singole voci merceologiche di composizione della raccolta degli imballaggi misti (carta, > plastica, vetro, ecc.), compreso gli scarti, trattando di raccolta dei rifiuti e non di avvio > a riciclo;
> -   i dati scaricati dal Catasto Nazionale Rifiuti ISPRA ed utilizzati per colmare i vuoti di > informativa regionale, organizzati per frazione merceologica, sono stati ricodificati per > codice rifiuto, assegnando alle singole frazioni i seguenti codici rifiuti: Carta (codice > 15200101), Plastica (codice 15200139), Metalli (codice 15200140), Legno (codice 15200138), > Organico (codice 20010802), Vetro (codice 15200102).
>
> Al fine di alleggerire l'esposizione di tutti i dati di raccolta differenziata previsti nel DM 26 Maggio 2016, si è scelto di accorpare all'interno del codice convenzionalmente riconosciuto 777777 tutte le raccolte differenziate minoritarie costituite dai codici rifiuti di seguito elencati: 80318, 150105, 150110, 150111, 160103, 160107, 160211, 160213, 160214, 160215, 160216, 160504, 160505, 170107, 170904, 200113, 200114, 200115, 200117, 200119, 200125, 200126, 200127, 200128, 200129, 200130, 200131, 200132, 200137, 200141, 200202, 200203, 200302, 200380, 20020102.
