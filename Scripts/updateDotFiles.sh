#!/bin/bash

DOTFILES_DIR=~/dotfiles
echo "updating/copying dotfiles."

mkdir -p $DOTFILES_DIR/bash
mkdir -p $DOTFILES_DIR/nvim
mkdir -p $DOTFILES_DIR/xfce4
mkdir -p $DOTFILES_DIR/alacritty
mkdir -p $DOTFILES_DIR/picom
mkdir -p $DOTFILES_DIR/Scripts
mkdir -p $DOTFILES_DIR/rofi
mkdir -p $DOTFILES_DIR/polybar
mkdir -p $DOTFILES_DIR/st
mkdir -p $DOTFILES_DIR/Wallpapers
mkdir -p $DOTFILES_DIR/dwm
mkdir -p $DOTFILES_DIR/images

echo "copying scripts"
rsync -a --exclude "dscCode.sh" ~/Scripts/ "$DOTFILES_DIR/Scripts/"

echo "copying .bashrc"
cp ~/.bashrc $DOTFILES_DIR/bash/

echo "copying nvim config."
cp ~/.config/nvim/init.lua $DOTFILES_DIR/nvim/

echo "copying xfce4 config."
cp -r ~/.config/xfce4/* $DOTFILES_DIR/xfce4/

echo "copying dwm configs"
if [ -d ~/.config/dwm ]; then
    rsync -a \
        --exclude=".git" \
        --exclude="*.o" \
        --exclude="*.out" \
        --exclude="*.swp" \
        --exclude="config.h" \
        --exclude="patches.h" \
        ~/.config/dwm/ "$DOTFILES_DIR/dwm/"
else
    echo "dwm config directory not found"
fi

echo "copying alacritty config."
if [ -f ~/.config/alacritty/alacritty.toml ]; then
    cp ~/.config/alacritty/alacritty.toml $DOTFILES_DIR/alacritty/
else
    echo "alacritty.toml not found"
fi

echo "copying picom config."
if [ -f ~/.config/picom/picom.conf ]; then
    cp ~/.config/picom/picom.conf $DOTFILES_DIR/picom/
else
    echo "picom.conf not found"
fi

echo "copying rofi config and themes."
if [ -d ~/.config/rofi ]; then
    rsync -a --exclude=".git" --exclude="*.swp" ~/.config/rofi/ "$DOTFILES_DIR/rofi/"
else
    echo "rofi config directory not found"
fi
echo "copying polybar config and scripts."
if [ -d ~/.config/polybar ]; then
    rsync -a ~/.config/polybar/ "$DOTFILES_DIR/polybar/"
else
    echo "polybar config directory not found"
fi

echo "copying st configs."
if [ -d ~/.config/st ]; then
    rsync -a \
        --exclude=".git" \
        --exclude="*.o" \
        --exclude="*.out" \
        --exclude="*.swp" \
        --exclude="config.h" \
        ~/.config/st/ "$DOTFILES_DIR/st/"
else
    echo "~/st directory not found"
fi

echo "copying wallpapers"
cp -r ~/Pictures/Wallpaper/* $DOTFILES_DIR/Wallpapers

echo "copying .xinitrc"
cp ~/.xinitrc $DOTFILES_DIR

echo "copying system images"
cp -r ~/Pictures/System/* $DOTFILES_DIR/images

echo "dotfiles updated"
