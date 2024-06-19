#!/bin/sh

cd .. # Skip this line if already running from repo root folder

mkdir -p BioT5/data/ttd

for link in  https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-02-TTD_drug_download.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-05-Drug_disease.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-06-Target_disease.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-07-Drug-TargetMapping.xlsx 
do
    wget -P BioT5/data/ttd $link  
done

python utils/xlsx_to_csv.py data/ttd/P1-07-Drug-TargetMapping.csv