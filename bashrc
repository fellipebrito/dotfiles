export RACK_ENV="development"
export MYSQL_USER=root
export MYSQL_PASSWORD=root

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
alias bi='rm Gemfile.lock;bundle install'
alias c='cd'
alias cpcov='rm -rf /vagrant/coverage/;cp -R coverage/ /vagrant/coverage'
alias ..='cd ..'
alias fuck='sudo $(history -p \!\!)'
alias g='git '
alias gad='g add .'
alias gbl='g branch -a'
alias gbc='g branch --merged | grep -v master | xargs git branch -d && git remote prune origin'
alias gcm='g commit -m'
alias gd='g diff'
alias gfa='g fetch --all'
alias gs='g status'
alias gps='g push'
alias gpu='g pull'
alias gsu='g pull && git submodule init && git submodule update --remote'
alias l='ls -lFhG --color'
alias la='ls -laFhG --color'
alias pg='psql -h localhost -U root -W '
alias rub='rubocop'
alias rubsimple='rubocop --format simple'
alias rsdoc='rspec spec --format documentation --order default'
alias rshtml='rspec --format h > /vagrant/output.html'
# alias rspec='rspec;cpcov'
alias cucumber='cucumber;cpcov'
alias test='rspec;cucumber'
alias tr='tree -P "*.rb" -I "assets|views|mailers|coverage" app'
alias u='cd ~'
alias ta='tmux attach-session -t '
alias tls='tmux ls'
alias tn='tmux new -s '
alias todo='vim /vagrant/TODO'
alias vim='/usr/bin/vim'
alias vrl='vagrant reload'
alias vpro='vagrant reload --provision'
alias vup='vagrant up'
alias vs='vagrant ssh'
alias www='cd ~/www'

### Default ps1 with colors:
### user@host path$
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
# PS1="$(tput setaf 2)[~\W$(tput setaf 7)\]\$(__git_ps1)$(tput setaf 2)]$ "
PS1='[\W/\[\033[0;37m\]$(__git_ps1 " (%s)")\[\033[0;12m\]]\$ '

#source ~/.bash_profile
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export rvmsudo_secure_path=1


function hasta_la_vista() {
  sudo killall -9 $1 2>/dev/null;
  if [ $? = 0 ]
  then
    echo ; echo " (╯°□°）╯︵  $(echo "$1"|toilet -f term -F rotate)"; echo
  fi
}

curl http://cowsay.me/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
