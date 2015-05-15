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

# DOT_DIR_NAME
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  tmp[$i]=${DOT_PATH[$i]%/*}
done
for ((i=0;i<${#tmp[@]};i++)); do
  DOT_DIR_NAME[$i]=${tmp[$i]##*/}
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

# DOT_FILE_SIZE
# Check file size
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  if [ -f ${DOT_PATH[$i]} ]; then
    DOT_FILE_SIZE[$i]=$(ls -hl ${DOT_PATH[$i]} | awk '{print $5}')
  elif [ -d ${DOT_PATH[$i]} ]; then
    DOT_FILE_SIZE[$i]=$(du -hs ${DOT_PATH[$i]} | cut -f 1)
  fi
done

# DOT_FILE_DATE
# Check file last-modified date
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  if [ $(uname) = Darwin ]; then
    if [ -f ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l ${DOT_PATH[$i]} | awk '{print $6"/"$7"-"$8}')
    elif [ -d ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l ${DOT_PATH[$i]%/*} | grep -w dot${DOT_NAME[$i]} | awk '{print $6"/"$7"-"$8}')
    fi
  else
    LS_TIME_STYLE_OPTION="--time-style=+%Y/%m/%d-%H:%M:%S"
    if [ -f ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l $LS_TIME_STYLE_OPTION ${DOT_PATH[$i]} | awk '{print $6}')
    elif [ -d ${DOT_PATH[$i]} ]; then
      DOT_FILE_DATE[$i]=$(ls -l $LS_TIME_STYLE_OPTION ${DOT_PATH[$i]%/*} | grep -w dot${DOT_NAME[$i]} | awk '{print $6}')
    fi
  fi
done

# EXDOT_NAME
CSV_FILE=~/.dotfiles/tools/exdotfile.csv
EXDOT_NAME=($(cat $CSV_FILE | cut -d ',' -f 2 | sed -e 's/"//g' -e '1d'))

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

