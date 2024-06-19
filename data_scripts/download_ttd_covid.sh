#! /bin/sh

cd .. # Skip this line if already running from repo root folder

for link in  https://db.idrblab.net/ttd/sites/default/files/ttd_database/COVID19-Drug-Data.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/COVID19-Target-Data.txt https://db.idrblab.net/ttd/sites/default/files/ttd_database/2D-Structures-of-Small-Molecule-Based-COVID19-Drugs.zip https://db.idrblab.net/ttd/sites/default/files/ttd_database/Sequence-of-COVID19-Protein-Drugs.txt
do
    mkdir -p BioT5/data/ttd
    wget -P BioT5/data/ttd $link 
    unzip BioT5/data/ttd/2D-Structures-of-Small-Molecule-Based-COVID19-Drugs.zip -d BioT5/data/ttd
done