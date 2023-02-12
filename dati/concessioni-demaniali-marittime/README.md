# Introduzione

> Il dataset continene i dati delle concessioni marittime gestiti dal SID il portale del mare -portale integrato per la pianificazione del demanio e dello spazio marittimo. Le informazioni contengono anche la geolocalizzazione nonché il valore di canone dovuto per l'anno in corso.

Il Ministero delle infrastrutture e dei Trasporti pubblica il dataset "[Concessioni Demaniali Marittime a Maggio 2021](https://dati.mit.gov.it/catalog/dataset/concessioni-demaniali-marittime-a-maggio-2021)"

È composto da **due risorse**, che abbiamo "**normalizzato**" e **arricchito**.

## Note sui dati esposti qui

Il dataset scaricato dal sito originario non si riesce a leggere subito con un client GIS come QGIS.

Per punti:

- [risorsa in formato _ESRI Shapefile_](https://dati.mit.gov.it/catalog/dataset/concessioni-demaniali-marittime-a-maggio-2021/resource/e475d004-72bb-4a2b-bee9-3ba6f4fd0e74)
  - il dataset originario è un file geografico in formato _ESRI Shapefile_, a cui non è assegnato un sistema di coordinate, non c'è infatti il file con estensione `prj`. Il sistema sembra essere `EPSG:3004` e abbiamo associato il nostro output a questo sistema;
  - il dataset originario è associato un intervallo di coordinate che non ha senso
    - in origine è `(-969460996.000000, -237081205.000000) - (701248452.000000,   1288726878.000000)` (minX, minY, maxX, maxY);
    - una volta normalizzato è `(1540817.884320, 3930371.140000) - (2831503.600000, 5074385.124000)`
- [risorsa in formato CSV](https://dati.mit.gov.it/catalog/dataset/concessioni-demaniali-marittime-a-maggio-2021/resource/5c368853-0890-489d-901d-76846aa1947e);
  - il file originale contiene nelle colonne `X` e `Y` i valori numerici di coordinate, ma anche la stringa `inf`. L'abbiamo rimossa quando presente e quindi ci sono alcuni record senza valori di coordinate;
  - nel sito di origine è indicato questo sistema di coordinate associato alle coppie di coordinate: "EPSG:6857". C'è un errore di battitura, e quello corretto è [EPSG:6875](https://epsg.io/6875). Abbiamo segnalato la cosa, ma non abbiamo avuto alcuna risposta, né è stata corretta la cosa sul sito.

I file di output:

- quello in formato _ESRI Shapefile_ è [`conconcessioni.zip`](conconcessioni.zip);
- quello in formato `CSV` è [`concessionietrf.csv`](concessionietrf.csv) (separatore di campo la `,`, _encoding_ `UTF-8`).
