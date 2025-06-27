#!/bin/bash
#!/bin/bash

DOTFILES_DIR=~/dotfiles
echo "updating/copying dotfiles."

mkdir -p $DOTFILES_DIR/bash
mkdir -p $DOTFILES_DIR/nvim
mkdir -p $DOTFILES_DIR/xfce4
mkdir -p $DOTFILES_DIR/alacritty
mkdir -p $DOTFILES_DIR/picom
mkdir -p $DOTFILES_DIR/Scripts

echo "copying scripts"
rsync -a --exclude "dscCode.sh" ~/Scripts/ "$DOTFILES_DIR/Scripts/"
 

echo "copying .bashrc"
cp ~/.bashrc $DOTFILES_DIR/bash/

echo "copying nvim config."
cp ~/.config/nvim/init.lua $DOTFILES_DIR/nvim/

echo "copying xfce4 config."
cp -r ~/.config/xfce4/* $DOTFILES_DIR/xfce4/

echo "copying alacritty config."

# incase i switch formats in the future
if [ -f ~/.config/alacritty/alacritty.toml ]; then
    cp ~/.config/alacritty/alacritty.toml $DOTFILES_DIR/alacritty/
else
    echo "alacritty.toml not found"
fi

echo "copying picom config."
if [ -f ~/.config/picom/picom.toml ]; then
    cp ~/.config/picom/picom.toml $DOTFILES_DIR/picom/
elif [ -f ~/.config/picom/picom.conf ]; then
    cp ~/.config/picom/picom.conf $DOTFILES_DIR/picom/
else
    echo "no picom config found"
fi

echo "dotfiles updated"

