#!/bin/bash
source ~/.dotfiles/tools/create_data.bash
source ~/.dotfiles/tools/create_list.bash

# Load first line
CSV_FILE=~/.dotfiles/tools/dotfile.csv
read FIRST_LINE < $CSV_FILE
FIRST_LINE=($(echo $FIRST_LINE | sed -e 's/"//g' -e 's/,/ /g'))

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
