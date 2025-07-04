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

echo "copying scripts"
rsync -a --exclude "dscCode.sh" ~/Scripts/ "$DOTFILES_DIR/Scripts/"

echo "copying .bashrc"
cp ~/.bashrc $DOTFILES_DIR/bash/

echo "copying nvim config."
cp ~/.config/nvim/init.lua $DOTFILES_DIR/nvim/

echo "copying xfce4 config."
cp -r ~/.config/xfce4/* $DOTFILES_DIR/xfce4/

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


echo "dotfiles updated"
