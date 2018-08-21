#export RACK_ENV="development"
export RACK_ENV="test"
source ~/.git-prompt.sh
#source "$(brew --prefix)/etc/bash_completion"

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
export CLICOLOR=1

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# alias
alias bi='bundle install'
alias dotfiles='vim /home/vagrant/.bashrc'
alias c='cd'
alias ..='cd ..'
alias f='foreman start local'
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
alias gpsjekyll="jekyll build;cd _site/;gad;gcm 'update';gps;cd ..;gad;gcm 'update submodule'; gps;"
alias gpu='g pull'
alias gsu='g pull && git submodule init && git submodule update --remote'
alias l='ls -lFhG'
alias la='ls -laFhG'
alias lr='lein repl'
alias lk='echo "Displaying in less pager..." && lein do kibit, cloverage, bikeshed, eastwood  | less'
alias pg='psql -h localhost -U root -W '
alias p='pwd'
alias rc='rails console'
alias rk='rake '
alias rkm='rk db:migrate'
alias rkr='rk db:reset'
alias rkapocalypse='rake db:drop db:create db:migrate db:schema:load db:seed'
alias rub='rubocop'
alias rubsimple='rubocop --format simple'
alias rsdoc='rspec spec --format documentation --order default'
alias rshtml='rspec --format h > /vagrant/output.html'
alias reload='source ~/.bash_profile'
#alias cucumber='cucumber'
#alias test='rspec;cucumber'
alias tr='tree -P "*.rb" -I "assets|views|mailers|coverage" app'
alias u='cd ~'
alias ta='tmux attach-session -t '
alias tls='tmux ls'
alias tn='tmux new -s '
alias todo='vim /vagrant/TODO'
alias vpn='/opt/cisco/anyconnect/bin/vpn -s '
alias vrl='vagrant reload'
alias vpro='vagrant reload --provision'
alias vup='vagrant up'
alias vs='vagrant ssh'
alias www='cd ~/www'
alias whoami='echo "Who is anyone?"'
alias whoareyou='echo "I am Batman"'

# Workflow Path
CDPATH=($HOME/www)

### Default ps1 with colors:
### user@host path$
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
# PS1="$(tput setaf 2)[~\W$(tput setaf 7)\]\$(__git_ps1)$(tput setaf 2)]$ "
PS1='[\W/\[\033[0;37m\]$(__git_ps1 " (%s)")\[\033[0;12m\]]\$ '

#source ~/.bash_profile
PATH=$PATH:$HOME/.rvm/bin:/usr/local/sbin # Add RVM to PATH for scripting
export rvmsudo_secure_path=1

function hasta_la_vista() {
  sudo killall -9 $1 2>/dev/null;
  if [ $? = 0 ]
  then
    echo ; echo " (╯°□°）╯︵  $(echo "$1"|toilet -f term -F rotate)"; echo
  fi
}

# curl http://cowsay.me/
export CLOJURESCRIPT_HOME=/lib/clojurescript

### Added by the Heroku Toolbelt
export PATH="/home/vagrant/dotfiles/bin:/usr/local/heroku/bin:$PATH"

export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

sesacvpn ()
{
  printf "%s\n%s\n%s" $VPN_GROUP $VPN_USER $VPN_PASS | vpn connect $VPN_HOST
}
