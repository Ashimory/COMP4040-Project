#!/bin/sh
mkdir -p ../BioT5/data/kaggle
cd ../BioT5/data/kaggle
kaggle datasets download -d divyansh22/drug-discovery-data
unzip drug-discovery-data.zip