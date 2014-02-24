# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

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
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# alias
alias bi='bundle install'
alias c='cd'
alias g='git '
alias gad='git add .'
alias gcm='git commit -m'
alias gd='git diff'
alias gs='git status'
alias gps='git push'
alias l='ls -lFh'
alias la='ls -laFh'
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

### Default ps1 with colors:
### user@host path$
PS1="\[\033[1;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
PS1="[\w]\$ "

#source ~/.bash_profile
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export rvmsudo_secure_path=1

# Git Completion
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#       . `brew --prefix`/etc/bash_completion
# fi
