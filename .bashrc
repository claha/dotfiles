# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias e='emacsclient -n'

# Export
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

# Configure prompt
PS1='[\u@\h \W]\$ '
