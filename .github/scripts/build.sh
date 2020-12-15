#!/usr/bin/env bash

mkdir -p ./build

# favicon
cmd="find ./favicon -type f -name "*.png" -o -name "*.ico" -exec zip -j ./build/aserto-favicons.zip {} +"
# echo $cmd
eval $cmd

# logo by orientation
declare -a orientation=("brandmark" "horizontal" "vertical")
for o in "${orientation[@]}"
do
    cmd="find ./logo -type f -name \"*-${o}-*\" -exec zip -j ./build/aserto-logos-${o##*/}.zip {} +"
    # echo $cmd
    eval $cmd
done

# logo by color
declare -a colors=("black" "color" "white" "white-text")
for c in "${colors[@]}"
do
    cmd="find ./logo -type f -name \"*-${c}.*\" -exec zip -j ./build/aserto-logos-${c##*/}.zip {} +"
    # echo $cmd
    eval $cmd
done

#logo by file type
declare -a filetypes=("png" "svg")
for f in "${filetypes[@]}"
do
    cmd="find ./logo -type f -name \"*.${f}\" -exec zip -j ./build/aserto-logos-${f##*/}.zip {} +"
    # echo $cmd
    eval $cmd
done
