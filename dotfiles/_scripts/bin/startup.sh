#!/bin/bash


# Wait for bspwm to start
sleep 2

# Eww powermenu
bspc desktop -f ^1
alacritty & disown
sleep 1


# Obsidian
bspc desktop -f ^4
obsidian & disown
sleep 1

# VScode
bspc desktop -f ^5
code & disown
sleep 1

# Tmux zsh
bspc desktop -f ^6
alacritty & disown
sleep 0.5

# Web
brave & disown
sleep 0.5


# Discord / Slack / Discussions
bspc desktop -f ^10
discord > /dev/null 2>&1 & disown
sleep 4

# End on powermenu
bspc desktop -f ^1
