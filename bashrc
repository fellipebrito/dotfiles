
# colors
[ -z "$TMUX" ] && export TERM=xterm-256color

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

# Include external files
# source ~/.bashrc_includes/*

# tell ls to be colourful
# export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# alias
alias bi='bundle install'
alias c='cd'
alias ..='cd ..'
alias g='git '
alias gad='git add .'
alias gcm='git commit -m'
alias gd='git diff'
alias gs='git status'
alias gps='git push'
alias gpu='git pull'
alias gsu='git pull && git submodule init && git submodule update --remote'
alias l='ls -lFh --color'
alias la='ls -laFh --color'
alias rub='rubocop'
alias rubsimple='rubocop --format simple'
alias tr='tree -P "*.rb" -I "assets|views|mailers" app'
alias u='cd ~'
alias vim='/usr/bin/vim'
alias vrl='vagrant reload'
alias vpro='vagrant reload --provision'
alias vup='vagrant up'
alias vs='vagrant ssh'
alias www='cd ~/www'
alias ta='tmux attach-session -t '
alias tls='tmux ls'
alias tn='tmux new -s '

### Default ps1 with colors:
### user@host path$
PS1="\[\033[1;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
PS1="[\w]\$ "

#source ~/.bash_profile
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export rvmsudo_secure_path=1

function fuck() {
  killall -9 $2 2>/dev/null;
  if [ $? = 0 ]
  then
    echo ; echo " (╯°□°）╯︵  $(echo "$2"|toilet -f term -F rotate)"; echo
  fi
}
