# Set shell to act like vim. Add set editing-mdoe vi in .inputrc for others
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
alias la='ls -lrat'
alias vi='vim'
alias find='find . -name'
alias grepr='grep -ir'
alias tarx='tar -xvzf'
alias notebook='ipython notebook'

# Git related aliases
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gco='git checkout -b'
alias gdis='git checkout --'
alias gr='git reset HEAD' 
alias gb='git branch'
alias ga='git add'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
# Import local shortcuts
source ~/.localrc
