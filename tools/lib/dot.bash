#!/bin/bash

# DOT_DIR
DOT_DIR=~/.dotfiles

# DOT_PATH
DOT_PATH=($(find ${DOT_DIR}/*/ -maxdepth 1 -name "dot.*"))

# DOT_NUM
DOT_NUM=${#DOT_PATH[@]}

for ((i=0;i<DOT_NUM;i++)); do
  # DOT_NAME
  DOT_NAME[$i]=.${DOT_PATH[$i]##*dot.}
  # DOT_FILE_TYPE
  if [ -f ${DOT_PATH[$i]} ]; then
    DOT_FILE_TYPE[$i]=File
  elif [ -d ${DOT_PATH[$i]} ]; then
    DOT_FILE_TYPE[$i]=Directory
  fi
  # DOT_DIR_NAME
  DOT_DIR_NAME[$i]=$(basename ${DOT_PATH[$i]%/*})
  # DOT_FILE_SIZE
  # Check file size
  if [ -f ${DOT_PATH[$i]} ]; then
    DOT_FILE_SIZE[$i]=$(ls -hl ${DOT_PATH[$i]} | awk '{print $5}')
  elif [ -d ${DOT_PATH[$i]} ]; then
    DOT_FILE_SIZE[$i]=$(du -hs ${DOT_PATH[$i]} | awk '{print $1}')
  fi
  # DOT_FILE_DATE
  # Check file last-modified date
  if [ $(uname) = Darwin ]; then
    if [ -f ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l ${DOT_PATH[$i]} | awk '{print $6"/"$7"-"$8}')
    elif [ -d ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l ${DOT_PATH[$i]%/*} | grep dot${DOT_NAME[$i]} | awk 'NR==1{print $6"/"$7"-"$8}')
    fi
  else
    LS_TIME_STYLE_OPTION="--time-style=+%Y/%m/%d-%H:%M:%S"
    if [ -f ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l $LS_TIME_STYLE_OPTION ${DOT_PATH[$i]} | awk '{print $6}')
    elif [ -d ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l $LS_TIME_STYLE_OPTION ${DOT_PATH[$i]%/*} | grep dot${DOT_NAME[$i]} | awk 'NR==1{print $6}')
    fi
  fi
done