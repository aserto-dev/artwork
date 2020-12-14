#!/usr/bin/env bash

declare -a arr=("favicon" "logo/brandmark" "logo/horizontal" "logo/vertical")

cwd=$PWD
mkdir -p ./build

for i in "${arr[@]}"
do
    cmd="zip -r ${cwd}/build/${i##*/}.zip . -x 'README.md'"
    cd $i
    eval $cmd
    cd $cwd
done
