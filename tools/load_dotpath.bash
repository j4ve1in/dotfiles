#!/bin/bash

# DOTDIR
i=0
while read line; do
    DOTDIR[$i]=$(echo $line | cut -d ',' -f 1 | sed -e 's/"//g' - | cut -d"(" -f2 | cut -d")" -f1)
    i=$((i + 1))
done < dotdir.csv
export DOTDIR

# DOTDIR_A
i=0
while read line; do
    DOTDIR_A[$i]=$(echo $line | cut -d ',' -f 1 | sed -e 's/"//g' - | cut -d"(" -f1)
    i=$((i + 1))
done < dotdir.csv
export DOTDIR_A

# DOTPATH
N=$(( ${#DOTDIR[@]} - 1))
for i in $(seq 1 $N); do
    DOTPATH+=($(find ~/.dotfiles/${DOTDIR[$i]} -maxdepth 1 -name ".*"))
done
export DOTPATH
