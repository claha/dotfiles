# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias e='emacsclient -n'
alias enw='emacs --no-window-system'

# Export
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

# Configure prompt
eval "$(starship init bash)"
