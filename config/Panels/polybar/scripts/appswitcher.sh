#!/bin/bash

# you need nerd fonts for these icons to actually be rendered
declare -A icons=(
  [navigator]=$'\uf269'   
  [webcord]=$'\ue62b'       
  [spotify]=$'\uf1bc'       
  [alacritty]=$'\ue795'     
)

blacklist=(
  xfdesktop
  xfce4-panel
  polybar
  conky
)

focused=$(xdotool getwindowfocus)

wmctrl -lx | while read -r line; do
  win_id=$(echo "$line" | awk '{print $1}')
  win_class_raw=$(echo "$line" | awk '{print $3}')
  win_class=${win_class_raw%%.*}
  class_lc=$(echo "$win_class" | tr '[:upper:]' '[:lower:]')

  # Skip blacklisted classes
  for skip in "${blacklist[@]}"; do
    [[ "$class_lc" == "$skip" ]] && continue 2
  done

  icon=${icons[$class_lc]:-""} 

  if [[ "$win_id" == "$focused" ]]; then
    fg="%{F#7aa2f7}"
    bg="%{B#1a1b26}"
  else
    fg="%{F#c0caf5}"
    bg=""
  fi

  echo -n "%{A1:wmctrl -ia $win_id:}$bg$fg$icon%{F-}%{B-}%{A}  "
done
