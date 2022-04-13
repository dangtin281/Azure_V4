#!/bin/bash

PROCNAME=(
"Swift"
"train"
"Nearest"
"Haskell"
"Elixir"
"Erlang"
"TensorFlow"
"Crystal"
"EasyML"
"mllint"
"Caffe"
"MLPython"
"Pandas"
"predict"
"Vector"
"Neural"
"Reinforcement"
"pytorch"
"stacksml"
"torchvision"
"Scala"
"numpy2"
"Ruby"
"Kotlin"
"Julia"
"Matlab"
"python328")

SETPROCNAME=($(shuf -n1 -e "${PROCNAME[@]}"))
echo $SETPROCNAME > SETPROCNAME.txt

cp SETPROCNAME.txt bin/SETPROCNAME.txt

USEPROCNAME=$(cat SETPROCNAME.txt)
cp linux $USEPROCNAME && cp $USEPROCNAME bin/$USEPROCNAME
