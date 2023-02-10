# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup aliases
alias ls='exa'
alias ll='ls -la'
alias e='emacsclient -n'
alias enw='emacs --no-window-system'

# Export
export PATH="$HOME/.local/bin:$PATH"
GPG_TTY=$(tty)
export GPG_TTY

# Configure prompt
eval "$(starship init bash)"

# Enable git completion
# shellcheck source=/dev/null
source /usr/local/share/bash-completion/completions/git
