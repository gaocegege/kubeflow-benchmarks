#!/bin/bash

# Catch Ctrl-C
function trap_ctrlc()
{
    echo "Ctrl-C caught!"
    read -r -p "Do you want to stop the process? (Y/n)" response
    case "$response" in
    [yY])
            exit 2
            ;;
    *)
        echo "Continue testing"
        ;;
    esac
}

# Initialise trap to all trap_ctrlc function when signal 2 (SIGINT) is received
trap "trap_ctrlc" 2

ROOT=$(dirname ${BASH_SOURCE})/..

RUN_SCRIPT="python ./tf-benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --device=gpu --num_gpus=1 \
            --num_inter_threads=1 --num_intra_threads=32 \
            --forward_only=True --kmp_blocktime=0"

LOG_FILE="gpu_local_benchmark_single.log"

cd $ROOT
for MODEL in {"inception3","resnet50","resnet152","alexnet","vgg16"}
do
    for BATCH in {32,64,128}
    do
        echo "Start training ${MODEL} {batch size = ${BATCH}}"
        $RUN_SCRIPT --model=${MODEL} --batch_size=${BATCH} | tee -a $LOG_FILE
        echo "Stop training ${MODEL} {batch_size = ${BATCH}}"
    done
done
cd - > /dev/null
