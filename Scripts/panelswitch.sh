#!/bin/bash

if pgrep -x polybar > /dev/null; then
    echo "activating xfce panel"
    pkill -x polybar
    xfce4-panel &
else
    echo "activating polybar"
    pkill -x xfce4-panel
    polybar mybar &
fi
