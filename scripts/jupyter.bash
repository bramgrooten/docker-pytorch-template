#!/usr/bin/env bash

if [ "$DOCKER_RUNNING" == true ] 
then
    echo "Inside docker instance"
    jupyter-lab  --ip 0.0.0.0 --port 8888 --no-browser --allow-root
    
else
    echo "Starting up docker instance..."

    cmp_volumes="--volume=$(pwd):/app/:rw"

    docker run --rm -ti \
        $cmp_volumes \
        -it \
        --gpus all \
        --ipc host \
        -p 8888:8888 \
        adrianorenstein/pytorch:2.0.0-cuda11.7-cudnn8-devel \
        jupyter-lab --ip 0.0.0.0 --port 8888 --no-browser --allow-root
fi