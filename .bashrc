export BASH_CONF="bashrc"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/share/npm/bin

export PATH

#colorize
export CLICOLOR=1
source "`brew --prefix`/etc/grc.bashrc"
source ~/dotfiles/.git-prompt.sh
export PS1="\[\033[0;32m\]\u@\\h\[\033[0m\]:\[\033[0;34m\]\W\[\033[0;35m\]\$(__git_ps1)\[\033[0;32m\]\$\[\033[0m\] "

alias ll='ls -al'
alias llt='ls -alt'
alias l.='ls -a'
alias getkey='pbcopy < ~/.ssh/id_rsa.pub'
alias g='git'
