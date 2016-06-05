#!/bin/bash

F="`echo 'Enter a formula' | dmenu -nb black -fn 'Migu 1M:size=13.5' -p 'Calc:'`"
if [ "Enter a formula" = "$F" ] || [ -z "$F" ]; then
  exit 1
elif [ -n "$F" ]; then
  if type bc >/dev/null 2>&1; then
    A=`echo "$F" | bc`
  fi
fi
if type xsel >/dev/null 2>&1; then
  echo "$A" | xsel -i
  echo "$A" | xsel -bi
fi
echo 'Press Enter or ESC key' | dmenu -nb black -fn 'Migu 1M:size=13.5' -p "Ans: ${F}=$A"
