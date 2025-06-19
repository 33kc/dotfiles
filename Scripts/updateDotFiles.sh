#!/bin/bash

DOTFILES_DIR=~/dotfiles
echo "updating/copying dotfiles."

mkdir -p $DOTFILES_DIR/bash
mkdir -p $DOTFILES_DIR/nvim
mkdir -p $DOTFILES_DIR/xfce4


echo "copying .bashrc"
cp ~/.bashrc $DOTFILES_DIR/bash/
echo "copying nvim config."
cp ~/.config/nvim/init.lua $DOTFILES_DIR/nvim/
echo "copying xfce4 config."
cp -r ~/.config/xfce4/* $DOTFILES_DIR/xfce4/

echo "dotfiles updated"
