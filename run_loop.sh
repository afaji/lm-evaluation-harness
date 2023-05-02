#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:1
#SBATCH --mem=64G

source ~/.bashrc
conda activate your_evn

for task in race sciq arc_challenge piqa sst mrpc cb rte wsc wsc273 winogrande wic copa webqs mnli mnli_mismatched anli_r1 anli_r2 anli_r3 squad2 record hellaswag qqp triviaqa
do
python main.py \
    --model $1 \
    --model_args pretrained=$2 \
    --tasks $task \
    --output_path $3$task.txt \
    --device cuda:0

done
