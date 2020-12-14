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

declare -a colors=("black" "color" "white" "white-text")

for c in "${colors[@]}"
do
    cmd="find ./logo -type f -name \"*-${c}.*\" -exec zip -j ${cwd}/build/${c##*/}.zip {} +"
    eval $cmd
done