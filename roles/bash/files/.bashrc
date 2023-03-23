# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup aliases
alias ls='exa'
alias ll='ls -la'
alias e='emacsclient -n'
alias g='git'
alias d='docker'

# Function for starting emacs without X combind with fzf
function enw() {
    if [[ -f $1 ]]; then
        emacs --no-window-system "$1"
    else
        path="$(fzf --select-1 --query "${1:-""}")"
        if [[ -z $path ]]; then
            path=$1
        fi
        emacs --no-window-system "$path"
    fi
}

# Export
export PATH="$HOME/.local/bin:$PATH"
GPG_TTY=$(tty)
export GPG_TTY

# Configure fzf
export FZF_DEFAULT_COMMAND="ag --hidden --follow --ignore .git --filename-pattern ''"
export FZF_DEFAULT_OPTS="--height 25% --border sharp --no-scrollbar --layout reverse --cycle"

# Configure prompt
eval "$(starship init bash)"

# Enable git completion
# shellcheck source=/dev/null
source /usr/local/share/bash-completion/completions/git
