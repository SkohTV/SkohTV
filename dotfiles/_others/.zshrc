# History of commands
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Load plugins
source /bin/antigen.zsh
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# For zsh-history-substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# x -> y
alias ll="exa -bghHlSF --colour=always --group-directories-first --icons"
alias lla="exa -abghHlSF --colour=always --group-directories-first --icons"
alias tr="exa -bghHlSF --tree --colour=always --group-directories-first --icons"
alias tra="exa -abghHlSF --tree --colour=always --group-directories-first --icons"
alias cat="bat"
alias __cat="bat --plain --color never --paging=never"
alias grep="rg --color=always"
alias __grep="/bin/grep"

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
alias sus="systemctl suspend"

alias lk="sudo loadkeys /usr/share/kbd/keymaps/i386/azerty/fr-latin1.map.gz"


# Attach vscode terminal to tmux session
if [[ -n $TMUX_INIT ]]; then
  tmux attach -t vscode
fi

# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_ed25519 2> /dev/null 

# Start terminal emulator
eval "$(starship init zsh)"
