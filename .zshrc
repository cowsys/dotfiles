export TERM="xterm-256color"


export PATH=$HOME/bin:$PATH
export PATH=$HOME/node_modules/.bin:$PATH
export GOPATH=$HOME
export THEMIS_HOME=$HOME/src/github.com/thinca/vim-themis # for vim-themis

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# GIT_PS1_SHOWUPSTREAM=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWSTASHSTATE=true

source /usr/local/opt/spaceship/spaceship.zsh

# alias setting
alias ls="ls -G -w"
alias ll="ls -la"

alias du="du -h"
alias df="df -h"

alias h1="head -n1"

alias vim="nvim"
alias v='nvim'
alias vv='nvim +te'
alias vr='nvim -R'

alias diff="colordiff"

alias gb='git branch'
alias gs='git status'
alias gp='git pull'

## global alias
alias -g G='| grep'
alias -g GV='| grep -v'
alias -g L='| less'
alias -g V='| nvim -'


alias gh=ghqcd
alias ccd=pecocd


# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=100000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

setopt share_history

# configs below are defined by ANSI escape codes
# https://chrisyeh96.github.io/2020/03/28/terminal-colors.html
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[33;41m'
export LESS_TERMCAP_se=$'\e[39;49m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# 補完機能
autoload -U compinit
compinit

## hook direnv
eval "$(direnv hook zsh)"

# ## for goenv
# export GOENV_ROOT="$HOME/.goenv"
# export PATH="$GOENV_ROOT/bin:$PATH"
# export PATH="$GOENV_ROOT/shims:$PATH"
# eval "$(goenv init -)"
# export PATH="$GOROOT/bin:$PATH"
# export PATH="$PATH:$GOPATH/bin"

# tmux起動後PATHが複数回セットされる問題の対応
## https://itto-ki.hatenablog.com/entry/2018/11/21/221856
typeset -U PATH


function mkc() {
    mkdir "$@" && cd "$@"
}
function pecocd() {
    local found="$( find . -maxdepth 3 -type d ! -path "*/.*" | sort -r | peco )"
    cd "$found"
}
function ghqcd() {
    local found="$( find $GOPATH/src -maxdepth 3 -type d ! -path "*/.*" | peco )"
    cd "$found"
}
function vcd() {
    local found="$( find $HOME/.vim/pack/devplugins -maxdepth 3 -type d | peco )"
    cd "$found"
}

if [ -n "$NVIM" ]; then
    if [ -x "$(command -v nvr)" ]; then
        alias nvim=nvr
    else
        alias nvim='echo "No nesting!"'
    fi
fi
