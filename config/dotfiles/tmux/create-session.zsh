#!/bin/zsh


# Extract args
NAME="$1"

# Check if session exist, then kill it
if [[ -z $(tmux has-session -t $NAME 2>&1) ]] then
  tmux kill-session -t $1
fi

# Create the session
tmux new-session -d -s $1

# Basic setup for tmux session (export for starship prompt & disable status bar)
tmux send-keys -t $1 "export TMUX_CURRENT_SESSION=$1" ENTER
tmux send-keys -t $1 "clear" ENTER

# Default commands for predefined tmux sessions
case $1 in
  "btop") tmux send-keys -t $1 "btop ; clear" ENTER ;;
  "cava") tmux send-keys -t $1 "cava ; clear" ENTER ;;
  "time") tmux send-keys -t $1 " " ENTER ;; 
  "neovim") ;;
  "zsh") tmux send-keys -t $1 "ll" ENTER ;;
esac

# Attach current terminal to session
tmux attach-session -t $1

# Kill session after finished
tmux kill-session -t $1
