#!/bin/bash
source ~/.dotfiles/tools/lib/create_data.bash

# DOT_DIR_NAME
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  tmp[$i]=${DOT_PATH[$i]%/*}
done
for ((i=0;i<${#tmp[@]};i++)); do
  DOT_DIR_NAME[$i]=${tmp[$i]##*/}
done

# DOT_FILE_SIZE
# Check file size
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  if [ -f ${DOT_PATH[$i]} ]; then
    DOT_FILE_SIZE[$i]=$(ls -hl ${DOT_PATH[$i]} | awk '{print $5}')
  elif [ -d ${DOT_PATH[$i]} ]; then
    DOT_FILE_SIZE[$i]=$(du -hs ${DOT_PATH[$i]} | awk '{print $1}')
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

# Load first line
source ~/.dotfiles/tools/lib/load_first_line.bash

# Count max length
N=${#FIRST_LINE[@]}
for ((i=0;i<N;i++)); do
  COL_MAX_LENGTH[$i]=${#FIRST_LINE[$i]}
done

N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  if [ "${#DOT_NUM[$i]}" -gt "${COL_MAX_LENGTH[0]}" ]; then
    COL_MAX_LENGTH[0]=${#DOT_NUM[$i]}
  fi
  if [ "${#DOT_NAME[$i]}" -gt "${COL_MAX_LENGTH[1]}" ]; then
    COL_MAX_LENGTH[1]=${#DOT_NAME[$i]}
  fi
  if [ "${#DOT_DIR_NAME[$i]}" -gt "${COL_MAX_LENGTH[2]}" ]; then
    COL_MAX_LENGTH[2]=${#DOT_DIR_NAME[$i]}
  fi
  if [ "${#DOT_FILE_TYPE[$i]}" -gt "${COL_MAX_LENGTH[3]}" ]; then
    COL_MAX_LENGTH[3]=${#DOT_FILE_TYPE[$i]}
  fi
  if [ "${#DOT_FILE_SIZE[$i]}" -gt "${COL_MAX_LENGTH[4]}" ]; then
    COL_MAX_LENGTH[4]=${#DOT_FILE_SIZE[$i]}
  fi
  if [ "${#DOT_FILE_DATE[$i]}" -gt "${COL_MAX_LENGTH[5]}" ]; then
    COL_MAX_LENGTH[5]=${#DOT_FILE_DATE[$i]}
  fi
done

# Display list
N=${#FIRST_LINE[@]}
COLOR="\x1b[7m"
Color_Reset="\x1b[0m"
for ((i=0;i<N;i++)); do
  printf "${COLOR}%-${COL_MAX_LENGTH[$i]}s${Color_Reset}" ${FIRST_LINE[$i]}
  if [ "$i" = "$((N-1))" ]; then
    echo
  else
    printf "${COLOR} ${Color_Reset}"
  fi
done

N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  printf "%-${COL_MAX_LENGTH[0]}s " ${DOT_NUM[$i]}
  printf "%-${COL_MAX_LENGTH[1]}s " ${DOT_NAME[$i]}
  printf "%-${COL_MAX_LENGTH[2]}s " ${DOT_DIR_NAME[$i]}
  printf "%-${COL_MAX_LENGTH[3]}s " ${DOT_FILE_TYPE[$i]}
  printf "%-${COL_MAX_LENGTH[4]}s " ${DOT_FILE_SIZE[$i]}
  printf "%-${COL_MAX_LENGTH[5]}s\n" ${DOT_FILE_DATE[$i]}
done

echo
