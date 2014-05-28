[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Path Manipulation
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/share/npm/bin
export PATH=/usr/local/bin:$PATH
DEFAULT_PATH=$PATH

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

# colorize
autoload -U colors && colors
export CLICOLOR=1
source ~/dotfiles/.git-prompt.sh

alias ll='ls -al'
alias getkey='pbcopy < ~/.ssh/id_rsa.pub'

alias g='git'
alias be='bundle exec '
alias r='rails'

alias vimt='VL=t VT=t vim .'
alias viml='VL=t vim .'

# Allow use of ^A / ^E for CLI movement
bindkey -e

# ^Z to foreground the last suspended job.
foreground-current-job() { fg; }
zle -N foreground-current-job
bindkey -M emacs '^z' foreground-current-job
bindkey -M viins '^z' foreground-current-job
bindkey -M vicmd '^z' foreground-current-job

# Find and format current git branch
git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null | cut -d '/' -f 3-)
  if [[ "$ref" =~ ^.+$ ]]; then
    echo " ($ref)"
  fi
}

set_prompt() {
  PROMPT="🚀  %{$fg[blue]%}%1~%{$fg[magenta]%}$(git_branch)%{$fg[cyan]%} →  %{$fg[black]%}"
}

# add ./bin to path for Spring (rails)
add_bin_to_path_if_necessary() {
  if [[ -d ./bin ]]; then
    export PATH=$HOME/.rvm/bin:./bin:$DEFAULT_PATH
  else
    export PATH=$DEFAULT_PATH
  fi
}

# These get run before every command
function precmd() {
  set_prompt
  #add_bin_to_path_if_necessary
}
