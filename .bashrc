export BASH_CONF="bashrc"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/share/npm/bin

export PATH

alias ll='ls -al'
alias llt='ls -alt'
alias l.='ls -a'
alias getkey='pbcopy < ~/.ssh/id_rsa.pub'
