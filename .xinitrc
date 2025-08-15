#!/bin/sh

export PATH="$HOME/.local/bin/statusbar:$PATH"
export ENV="$HOME/.dashrc"


eval $(dbus-launch --sh-syntax --exit-with-session)
[ -f ~/.config/dwm/autostart/autostart.sh ] && ~/.config/dwm/autostart/autostart.sh &
exec dwm
