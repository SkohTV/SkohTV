# Lines configured by zsh-newuser-install
HISTFILE="~/.histfile"
HISTSIZE=10000
SAVEHIST=10000

# Load plugins
source /bin/antigen.zsh
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen apply


# x -> y
alias ll="exa -abghHlSF --colour=always --group-directories-first --icons"
alias tr="exa -abghHlSF --tree --level=3 --colour=always --group-directories-first --icons"
alias cat="bat"
alias __cat="bat --plain --color never --paging=never"
alias grep="rg --color=always"

# General QoL
alias c="clear"
alias df="df -h"
alias du="du -h"
alias free="free -m"
alias wget="wget -c"
alias ping="ping -c 5"
alias mkdir="mkdir -pv"

# Safety
alias rm="rm -i"
alias mv="mv -i"

# Shortening
alias list_wifi="nmcli dev wifi rescan && nmcli dev wifi list"
alias brave="nohup brave & disown ; exit"
alias copy="xclip -selection primary"
alias lock=""


# Start terminal emulator
eval "$(starship init zsh)"
