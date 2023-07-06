# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Aliases
alias ll="exa -bghHlSF --icons"
alias llf="exa -abghHlSF --icons"
alias tr="exa --tree -abghHlSF --icons --level=3"
alias eww="/opt/eww/target/release/eww"

alias rainfall="~/screensavers/rainfall/rainfall.py"
alias cbonsai="~/screensavers/cbonsai/cbonsai -l -t 0.5 -i -w 30 -m ' Smol Tree'"

alias rtmux="~/.config/tmux/create-session.zsh"
alias lock="swaylock"
alias firefox="nohup firefox-developer-edition & disown && exit"

# Start terminal emulator
eval "$(starship init zsh)"
