#!/bin/bash

# DOT_PATH
DOT_PATH=($(find ~/.dotfiles/*/ -maxdepth 1 -name "dot.*"))

# DOT_NUM
N=${#DOT_PATH[@]}
for ((i=0;i<N;i++)); do
  ((DOT_NUM[i]=i+1))
done

# DOT_NAME
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  DOT_NAME[$i]=.${DOT_PATH[$i]##*dot.}
done

# DOT_FILE_TYPE
# Check file type
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  if [ -f ${DOT_PATH[$i]} ]; then
    DOT_FILE_TYPE[$i]=File
  elif [ -d ${DOT_PATH[$i]} ]; then
    DOT_FILE_TYPE[$i]=Directory
  fi
done

# EXDOT_NAME
CSV_FILE=~/.dotfiles/tools/data/exdotfile.csv
EXDOT_NAME=($(awk -F ',' '{print $2}' $CSV_FILE | sed '1d;s/"//g'))

# EXDOT_FILE_TYPE
# Check file type
N=${#EXDOT_NAME[@]}
for ((i=0;i<N;i++)); do
  if [ -f ~/${EXDOT_NAME[$i]} ]; then
    EXDOT_FILE_TYPE[$i]=File
  elif [ -d ~/${EXDOT_NAME[$i]} ]; then
    EXDOT_FILE_TYPE[$i]=Directory
  fi
done

