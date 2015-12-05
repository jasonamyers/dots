# .bashrc

# User specific aliases and functions
alias ls='ls -G'
alias ll='ls -hlatr'
alias gg='history | grep'
alias breakitdown="history | awk '{a[$2]++ } END{for(i in a){print a[i] ' ' i}}'|sort -rn |head -n 20"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias pms='python manage.py runserver'
alias pmsh='python manage.py shell'
alias pmdb='python manage.py dbshell'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vim='emacsclient -t'
alias vi='emacsclient -t'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# Setup bash history
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:ls:ll:la:l:cd:pwd:exit:mc:su:df:clear"

export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper

export NVM_DIR="/Users/jasomyer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=emacsclient
export GOROOT=/usr/local/go
export GOPATH=~/dev/go
export PATH=$PATH:$GOROOT/bin
export RUST_SRC_PATH=/Users/jasomyer/.rust/src
