for link in  https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-02-TTD_drug_download.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-05-Drug_disease.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-06-Target_disease.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/P1-07-Drug-TargetMapping.xlsx 
do
    mkdir -p BioT5/data/drugbank
    wget -P BioT5/data/drugbank $link  
done