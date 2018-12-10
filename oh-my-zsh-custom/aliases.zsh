alias bi='bundle install'
alias fuck='sudo $(history -p \!\!)'
alias p='pwd'
alias pip='pip3'
alias reload='source ~/.zshrc'
alias ta='tmux attach-session -t '
alias tls='tmux ls'
alias tn='tmux new -s '
alias sandbox='cd ~/sandbox'
alias whoami='echo "Who is anyone?"'
alias whoareyou='echo "I am Batman"'

alias gs="gss"

alias zshconfig="vim ~/.zshrc"
alias zc="zshconfig"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias aliases="vim ~/.oh-my-zsh-custom/aliases.zsh"

alias vpn='/opt/cisco/anyconnect/bin/vpn -s'
alias sesac-vpn='vpn connect vpn.sesac.com'

alias dg='/usr/local/bin/datagrip'

alias create_virtual_env='virtualenv venv --python=python3'
alias pcompile='pip-compile --output-file requirements/requirements-dev.txt requirements/requirements-dev.in'
alias pinstall='pip install -r requirements/requirements-dev.txt'

alias post='curl -X POST'

alias dup='docker-compose up -d'
alias dstop='docker-compose stop'
alias djb='docker-compose exec site jekyll build'
