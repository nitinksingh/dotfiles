# Set shell to act like vim, but keep some of the emacs bindings
set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word

# Export some variable names
export VIMRC='~/.vimrc'

# Some handy short-cuts
alias ll='ls -lrt'
alias vi='vim'
alias find='find . -name'
alias grepr='grep -ir'

# Git related aliases
alias gs='git status'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'

# Import local shortcuts
source ~/.localrc
