#! /bin/sh

#TOO LITTLE DATA; DOESN'T WORK

export task="covid_prediction"
export model_path="/home/ubuntu/20minh.nd/COMP4040-Project/models/biot5-base/pytorch_model.bin"
export log_path="logs/base_covid_prediction"
export n_node=1
export n_gpu_per_node=1
export data_dir="../data/splits/covid/prediction"

export CUDA_VISIBLE_DEVICES=4

bash finetune_covid.sh