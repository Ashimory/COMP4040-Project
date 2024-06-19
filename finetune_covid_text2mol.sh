#! /bin/sh

export task="covid_text2mol"
export model_path="/home/ubuntu/20minh.nd/COMP4040-Project/models/biot5-base-text2mol/pytorch_model.bin"
# export log_path="logs/base_covid_text2mol"
export log_path="logs/augmented_covid_text2mol"
export n_node=1
export n_gpu_per_node=1
# export data_dir="../data/splits/covid/text2mol"
export data_dir="../data/splits/covid/text2mol_augmented"

export CUDA_VISIBLE_DEVICES=0

bash finetune_covid.sh