#!/bin/bash

REPO="$HOME/dev/repo/SkohTV/dotfiles"


copy_file() {
   cp $4 $1 $2
   echo "-> $3 successfully imported"
}


echo "Starting to import..."


# _others
copy_file "$HOME/.zshrc" "$REPO/_others/" ".zshrc"
copy_file "$HOME/.config/homepage.html" "$REPO/_others/" "homepage.html"

# _scripts
copy_file "$HOME/bin" "$REPO/_scripts/" "ALL scripts" "-r"


# specific
copy_file "$HOME/.config/alacritty/" "$REPO/alacritty/" "alacritty" "-r"
copy_file "$HOME/.config/starship.toml" "$REPO/starship/" "starship"
copy_file "$HOME/.tmux.conf" "$REPO/tmux/" "tmux"

copy_file "$HOME/.xinitrc" "$REPO/xinit/" "xinit"
copy_file "$HOME/.config/bspwm/" "$REPO/bspwm/" "bspwm" "-r"
copy_file "$HOME/.config/sxhkd/" "$REPO/sxhkd/" "sxhkd" "-r"

copy_file "$HOME/.config/picom/" "$REPO/picom/" "picom" "-r"
copy_file "$HOME/.config/eww/" "$REPO/eww/" "eww" "-r"


echo "Everything has been imported !"
