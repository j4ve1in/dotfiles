#!/bin/bash

RET=$(echo -e "shutdown\nreboot\nlogout" | dmenu -nb black -fn 'Migu 1M:size=13.5' -p "Power")

case $RET in
  shutdown) halt -p ;;
  reboot) reboot ;;
  logout) xdotool key "super+shift+q" ;;
  *) ;;
esac
