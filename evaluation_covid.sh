[ -z "${task}" ] && task="text2mol"
[ -z "${result_file_path}" ] && result_file_path="baseline.tsv"
[ -z "${model_path}" ] && model_path="/home/ubuntu/20minh.nd/COMP4040-Project/models/biot5-base-text2mol/pytorch_model.bin"
[ -z "${log_path}" ] && log_path="logs/baseline_covid_text2mol"
[ -z "${task_dir}" ] && task_dir="../data/tasks"
[ -z "${data_dir}" ] && data_dir="../data/splits/covid/text2mol"

cd BioT5/biot5

python main.py \
        task=${task} \
        test_task=${task} \
        result_fn=${result_file_path} \
        model.checkpoint_path=${model_path} \
        data.task_dir=${task_dir} \
        data.data_dir=${data_dir} \
        hydra.run.dir=${log_path} \
        predict_only=true \
        optim.grad_acc=1