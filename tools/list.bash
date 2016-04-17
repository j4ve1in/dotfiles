#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash

source_lib dot

FIRST_LINE=(
  'No.'
  'Name'
  'FileType'
  'Size'
  'Last-Modified-Date'
)

# Count max length
N=${#FIRST_LINE[@]}
for ((i=0;i<N;i++)); do
  COL_MAX_LENGTH[$i]=${#FIRST_LINE[$i]}
done

if [ "${#DOT_NUM}" -gt "${COL_MAX_LENGTH[0]}" ]; then
  COL_MAX_LENGTH[0]=${#DOT_NUM}
fi
for ((i=0;i<DOT_NUM;i++)); do
  if [ "${#DOT_NUM[$i]}" -gt "${COL_MAX_LENGTH[0]}" ]; then
    COL_MAX_LENGTH[0]=${#DOT_NUM[$i]}
  elif [ "${#DOT_NAME[$i]}" -gt "${COL_MAX_LENGTH[1]}" ]; then
    COL_MAX_LENGTH[1]=${#DOT_NAME[$i]}
  elif [ "${#DOT_FILE_TYPE[$i]}" -gt "${COL_MAX_LENGTH[2]}" ]; then
    COL_MAX_LENGTH[2]=${#DOT_FILE_TYPE[$i]}
  elif [ "${#DOT_FILE_SIZE[$i]}" -gt "${COL_MAX_LENGTH[3]}" ]; then
    COL_MAX_LENGTH[3]=${#DOT_FILE_SIZE[$i]}
  elif [ "${#DOT_FILE_DATE[$i]}" -gt "${COL_MAX_LENGTH[4]}" ]; then
    COL_MAX_LENGTH[4]=${#DOT_FILE_DATE[$i]}
  fi
done

# Display list
N=${#FIRST_LINE[@]}
REVERSE="\x1b[7;39;49m"
COLOR_RESET="\x1b[0;39;49m"
printf "$REVERSE"
for ((i=0;i<N;i++)); do
  printf "%-${COL_MAX_LENGTH[$i]}s" ${FIRST_LINE[$i]}
  [ "$i" = "$((N-1))" ] && echo || printf " "
done
printf "$COLOR_RESET"

for ((i=0;i<DOT_NUM;i++)); do
  printf "%-${COL_MAX_LENGTH[0]}s "  $((i+1))
  printf "%-${COL_MAX_LENGTH[1]}s "  ${DOT_NAME[$i]}
  printf "%-${COL_MAX_LENGTH[2]}s "  ${DOT_FILE_TYPE[$i]}
  printf "%-${COL_MAX_LENGTH[3]}s "  ${DOT_FILE_SIZE[$i]}
  printf "%-${COL_MAX_LENGTH[4]}s\n" ${DOT_FILE_DATE[$i]}
done

echo
