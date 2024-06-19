#! /bin/sh

export task="covid_mol2text"
export model_path="/home/ubuntu/20minh.nd/COMP4040-Project/models/biot5-base-mol2text/pytorch_model.bin"
# export log_path="logs/base_covid_mol2text"
export log_path="logs/augmented_covid_mol2text"
export n_node=1
export n_gpu_per_node=1
# export data_dir="../data/splits/covid/mol2text"
export data_dir="../data/splits/covid/mol2text_augmented"
export CUDA_VISIBLE_DEVICES=1

bash finetune_covid.sh