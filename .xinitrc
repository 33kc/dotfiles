#!/bin/sh

eval $(dbus-launch --sh-syntax --exit-with-session)
[ -f ~/.config/dwm/autostart/autostart.sh ] && ~/.config/dwm/autostart/autostart.sh &
exec dwm
