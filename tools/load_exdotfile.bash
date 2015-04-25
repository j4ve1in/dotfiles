#!/bin/bash

# Exdotfile
i=0
while read line; do
    EXDOTFILE[$i]=$(echo $line | cut -d ',' -f 1 | sed -e 's/"//g' -)
    i=$((i + 1))
done < exdotfile.csv
export EXDOTFILE
