#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

# Initialize csv file
CSV_FILE=~/.dotfiles/tools/data/dotfile.csv
: > $CSV_FILE

# Write csv file
## First line
source_dotool lib/load_first_line
{
  N=${#FIRST_LINE[@]}
  for ((i=0;i<N;i++)); do
    printf '"'${FIRST_LINE[$i]}'"'
    if [ "$i" = "$((N-1))" ]; then
      printf "\n"
    else
      printf ','
    fi
  done
} >> $CSV_FILE
## Others
N=${#DOT_NUM[@]}
for ((i=0;i<N;i++)); do
  {
    printf '"'${DOT_NUM[$i]}'"',
    printf '"'${DOT_NAME[$i]}'"',
    printf '"'${DOT_DIR_NAME[$i]}'"',
    printf '"'${DOT_FILE_TYPE[$i]}'"',
    printf '"'${DOT_FILE_SIZE[$i]}'"',
    echo '"'${DOT_FILE_DATE[$i]}'"'
  } >> $CSV_FILE
done
