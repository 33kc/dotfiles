#!/bin/dash

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$DOTFILES_DIR/config"
echo "Updating/copying dotfiles..."

mkdir -p "$CONFIG_DIR/Shells/bash"
mkdir -p "$CONFIG_DIR/Shells/dash"

mkdir -p "$CONFIG_DIR/Terminals/alacritty"
mkdir -p "$CONFIG_DIR/Terminals/st"

mkdir -p "$CONFIG_DIR/Compositor/picom"

mkdir -p "$CONFIG_DIR/Panels/polybar"
mkdir -p "$CONFIG_DIR/Panels/dwmblocks"

mkdir -p "$CONFIG_DIR/WM/dwm"
mkdir -p "$CONFIG_DIR/DE/xfce4"

mkdir -p "$CONFIG_DIR/ExtraConfigs/nvim"
mkdir -p "$CONFIG_DIR/ExtraConfigs/neofetch"
mkdir -p "$CONFIG_DIR/ExtraConfigs/rofi"

mkdir -p "$DOTFILES_DIR/Scripts"
mkdir -p "$DOTFILES_DIR/Wallpapers"
mkdir -p "$DOTFILES_DIR/Images"

# --- Shell configs ---
cp "$HOME/.bashrc" "$CONFIG_DIR/Shells/bash/.bashrc" 2>/dev/null || echo ".bashrc not found"
cp "$HOME/.dashrc" "$CONFIG_DIR/Shells/dash/.dashrc" 2>/dev/null || echo ".dashrc not found"

# --- Terminal configs ---
cp "$HOME/.config/alacritty/alacritty.toml" "$CONFIG_DIR/Terminals/alacritty/alacritty.toml" 2>/dev/null || echo "alacritty.toml not found"
rsync -a --exclude=".git" --exclude="*.o" --exclude="*.out" --exclude="*.swp" --exclude="config.h" "$HOME/.config/st/" "$CONFIG_DIR/Terminals/st/" 2>/dev/null || echo "st config not found"

# --- Compositor ---
cp "$HOME/.config/picom/picom.conf" "$CONFIG_DIR/Compositor/picom/picom.conf" 2>/dev/null || echo "picom.conf not found"

# --- Panels ---
rsync -a "$HOME/.config/polybar/" "$CONFIG_DIR/Panels/polybar/" 2>/dev/null || echo "polybar config not found"
rsync -a --exclude='.git' "$HOME/.config/dwmblocks/" "$DOTFILES_DIR/config/Panels/dwmblocks/"

# --- WM / DE ---
rsync -a --exclude=".git" --exclude="*.o" --exclude="*.out" --exclude="*.swp" --exclude="config.h" --exclude="patches.h" "$HOME/.config/dwm/" "$CONFIG_DIR/WM/dwm/" 2>/dev/null || echo "dwm config not found"
rsync -a "$HOME/.config/xfce4/" "$CONFIG_DIR/DE/xfce4/" 2>/dev/null || echo "xfce4 config not found"

# --- Extra configs ---
cp "$HOME/.config/nvim/init.lua" "$CONFIG_DIR/ExtraConfigs/nvim/init.lua" 2>/dev/null || echo "nvim/init.lua not found"
rsync -a "$HOME/.config/neofetch/" "$CONFIG_DIR/ExtraConfigs/neofetch/" 2>/dev/null || echo "neofetch config not found"
rsync -a --exclude=".git" --exclude="*.swp" "$HOME/.config/rofi/" "$CONFIG_DIR/ExtraConfigs/rofi/" 2>/dev/null || echo "rofi config not found"

# --- Scripts ---
rsync -a --exclude="dscCode.sh" "$HOME/Scripts/" "$DOTFILES_DIR/Scripts/" 2>/dev/null || echo "Scripts directory not found"

# --- Wallpapers ---
rsync -a "$HOME/Pictures/Wallpaper/" "$DOTFILES_DIR/Wallpapers/" 2>/dev/null || echo "Wallpapers not found"

# --- System images ---
rsync -a "$HOME/Pictures/System/" "$DOTFILES_DIR/Images/" 2>/dev/null || echo "System images not found"

# --- .xinitrc ---
cp "$HOME/.xinitrc" "$DOTFILES_DIR/.xinitrc" 2>/dev/null || echo ".xinitrc not found"

echo "Dotfiles updated."
