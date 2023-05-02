# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup aliases
alias ls='exa'
alias ll='ls -la'
alias e='emacsclient -n'
alias enw='emacs --no-window-system'
alias g='git'
alias d='docker'

# Export
export PATH="$HOME/.local/bin:$PATH"
GPG_TTY=$(tty)
export GPG_TTY

# Configure fzf
# shellcheck source=/dev/null
source /usr/share/fzf/completion.bash
# shellcheck source=/dev/null
source /usr/share/fzf/key-bindings.bash
export FZF_DEFAULT_COMMAND="ag --hidden --follow --ignore .git --filename-pattern ''"
export FZF_DEFAULT_OPTS="--height 25% --border sharp --no-scrollbar --layout reverse --cycle"
_fzf_setup_completion path e enw

# Configure prompt
eval "$(starship init bash)"

# Enable git completion
# shellcheck source=/dev/null
source /usr/local/share/bash-completion/completions/git
