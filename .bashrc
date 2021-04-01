HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=4000
shopt -s histappend
export EDITOR=/usr/bin/vim

alias cp='cp -Rv'
alias ls='ls --color=auto -ACF'
alias ll='ls --color=auto -alF'
alias grep='grep --color=auto'
alias grepw='grep --color=auto -Hrnwi'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias moscow='curl wttr.in/Moscow'
alias wget='wget -c'
alias tree="tree -aI 'test*|.git|node_modules|logs|outputs|legacy'"
alias gits='git status'
alias goto='git checkout'
alias branches='git branch -v'
alias remotes='git remote -v'
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias vpn='sudo protonvpn'

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
    __git_complete goto _git_checkout
fi

# show contents of dir after action
function cd() {
    builtin cd "$1"
    ls -ACF
}

# python stuff
alias pv='pyenv which python'
alias pg38='export PYENV_VERSION="3.8.5"'
alias pg39='export PYENV_VERSION="3.9.0"'
alias pgpypy='export PYENV_VERSION="pypy3.7-7.3.3"'
alias db='ssh -Ap ${PORT} bigdatov@${HOST}'
alias tl='tmux a -t "j"'

source "$HOME/.cargo/env"
source "$HOME/.poetry/env"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

export PYENV_VERSION="3.9.0"
eval "$(pyenv init -)"
# eval "$(thefuck --alias)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # this loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # this loads nvm bash_completion

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
