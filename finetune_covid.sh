[ -z "${task}" ] && task=dti
[ -z "${model_path}" ] && model_path="path_to_your_model"
[ -z "${log_path}" ] && log_path="path_to_your_log"
[ -z "${task_dir}" ] && task_dir="../data/tasks"
[ -z "${data_dir}" ] && data_dir="../data/splits/dti/dti_biosnap"
[ -z "${n_node}" ] && n_node=1
[ -z "${n_gpu_per_node}" ] && n_gpu_per_node=1

cd BioT5/biot5

export TOKENIZERS_PARALLELISM=false

# torchrun --nnodes=${n_node} --nproc_per_node=${n_gpu_per_node} --rdzv-backend=c10d --rdzv-endpoint=localhost:0 main.py \
#     task=${task} \
#     model.name=google/t5-v1_1-base \
#     model.random_init=false \
#     model.checkpoint_path=${model_path} \
#     data.task_dir=${task_dir} \
#     data.data_dir=${data_dir} \
#     molecule_dict=dict/selfies_dict.txt \
#     hydra.run.dir=${log_path} \
#     optim.total_steps=2000 optim.warmup_steps=50 optim.name=adamw \
#     optim.lr_scheduler=cosine optim.base_lr=1e-3 \
#     seed=42 \
#     model.compile=false \
#     pred.every_steps=20 logging.every_steps=2 \
#     optim.batch_size=48 optim.grad_acc=12 optim.test_bsz_multi=1 \

torchrun --nnodes=${n_node} --nproc_per_node=${n_gpu_per_node} --rdzv-backend=c10d --rdzv-endpoint=localhost:0 main.py \
    task=${task} \
    model.name=google/t5-v1_1-base \
    model.random_init=false \
    model.checkpoint_path=${model_path} \
    data.task_dir=${task_dir} \
    data.data_dir=${data_dir} \
    molecule_dict=dict/selfies_dict.txt \
    hydra.run.dir=${log_path} \
    seed=42 \
    model.compile=false \