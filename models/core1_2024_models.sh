#!/bin/bash
SCRIPT_DIR=`realpath $(dirname "$0")`
TARGET_MODEL=${1:-yolox_s}
TRT_WORKSPACE=16
MODEL_URL="https://github.com/Megvii-BaseDetection/YOLOX/releases/download/0.1.1rc0/${TARGET_MODEL}.onnx"

cd $SCRIPT_DIR
wget $MODEL_URL -O ${TARGET_MODEL}.onnx

/usr/src/tensorrt/bin/trtexec \
    --onnx=${TARGET_MODEL}.onnx \
    --saveEngine=${TARGET_MODEL}.trt \
    --fp16 --verbose --workspace=$((1<<$TRT_WORKSPACE))
