#!/bin/sh
read -p "Video link: " link
mpv "$(yt-dlp -g "$link")" &
