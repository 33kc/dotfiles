#!/bin/sh

feh --bg-scale ~/Pictures/Wallpaper/pixelartidk6.jpg &

/home/kc/.config/polybar/scripts/launch.sh &
# dwmblocks &
# slstatus &

for script in ~/Scripts/autostart/*; do
    [ -x "$script" ] && "$script" &
done

picom &
