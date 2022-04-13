#!/bin/bash
rm -rf download/*

linkrand=(
"https://github.com/tensorflow/tensorflow"
"https://github.com/rapidsai/cudf"
"https://github.com/rapidsai/gpu-bdb"
"https://github.com/rapidsai/cusignal"
"https://github.com/rapidsai/cuspatial"
"https://github.com/rapidsai/dask-cuda"
"https://github.com/rapidsai/docker"
"https://github.com/tyiannak/ml-python"
"https://github.com/rapidsai/gpuci-tools"
"https://github.com/rapidsai/cupy"
"https://github.com/rapidsai/deeplearning"
"https://github.com/tyiannak/pyAudioAnalysis"
"https://github.com/NVIDIA/fsi-samples"
"https://github.com/NVIDIA/DALI"
"https://github.com/roscisz/TensorHive"
"https://github.com/NVIDIA/cuda-samples"
"https://github.com/NVIDIA/tensorflow"
"https://github.com/moderngpu/moderngpu"
"https://github.com/JuliaGPU/CUDA.jl"
"https://github.com/JuliaGPU/ArrayFire.jl"
"https://github.com/JuliaGPU/GPUCompiler.jl"
"https://github.com/NVIDIA/TensorRT"
"https://github.com/NVIDIA/apex"
"https://github.com/onnx/onnx-tensorrt"
"https://github.com/NVIDIA/DIGITS"
"https://github.com/triton-inference-server/server"
"https://github.com/google/jax"
"https://github.com/NVIDIA-AI-IOT/torch2trt"
"https://github.com/NVIDIA-AI-IOT/trt_pose"
"https://github.com/tlkh/ai-lab"
"https://github.com/NVIDIA/DeepLearningExamples")

        linkransuff=($(shuf -n1 -e "${linkrand[@]}"))
        mkdir -p download
        cd download/
        git clone "$linkransuff"
        cd ..
        date >> git.log


