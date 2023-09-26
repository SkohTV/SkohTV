#!/bin/bash

# Reset
tmux kill-server
sleep 0.5

# Create sessions
tmux new-session -d -s vscode
tmux new-session -d -s main
tmux new-session -d -s btop
tmux new-session -d -s tiramisu-notif

# Set starship env_var
tmux send-keys -t vscode "export TMUX_ENV='vscode' ; clear" Enter
tmux send-keys -t main "export TMUX_ENV='main' ; clear" Enter
tmux send-keys -t btop "export TMUX_ENV='btop' ; clear" Enter
tmux send-keys -t tiramisu-notif "export TMUX_ENV='notif' ; clear" Enter

# Configure sessions
tmux split-window -t main -h
tmux send-keys -t btop "btop" Enter
tmux send-keys -t main "export TMUX_ENV='second' ; clear" Enter
tmux send-keys -t tiramisu-notif "sh $HOME/.config/eww/scripts/notifications.sh write" Enter
