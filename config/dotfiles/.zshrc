# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias ll="exa -abghHlSF --icons"
alias tr="exa --tree -abghHlSF --icons --level=3"

alias lock=""
alias chromium="nohup chromium & disown && exit"

# Start terminal emulator
eval "$(starship init zsh)"
