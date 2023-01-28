# Introduzione

Il Ministero delle infrastrutture e dei Trasporti pubblica il dataset "[Concessioni Demaniali Marittime a Maggio 2021](https://dati.mit.gov.it/catalog/dataset/concessioni-demaniali-marittime-a-maggio-2021)"

È un file "geografico", che abbiamo "normalizzato" e arricchito.

# Note sui dati esposti qui

Il dataset scaricato dal sito originario non si riesce a leggere subito con un client GIS come QGIS.

Per punti:

- il dataset originario è un file geografico in formato _ESRI Shapefile_, a cui non è assegnato un sistema di coordinate, non c'è infatti il file con estensione `prj`. Il sistema sembre essere `EPSG:3004` e abbiamo associato il nostro output a questo sistema;
- il dataset origianario è associato un intervallo di coordinate che non ha senso per l'Italia
  - in origine è `(-969460996.000000, -237081205.000000) - (701248452.000000, 1288726878.000000)` (minX, minY, maxX, maxY);
  - una volta normalizzato è `(1540817.884320, 3930371.140000) - (2831503.600000, 5074385.124000)`

Il file di output è [`conconcessioni.zip`](conconcessioni.zip)
