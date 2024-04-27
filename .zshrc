export TERM="xterm-256color"


export PATH=$HOME/bin:$PATH
export PATH=$HOME/src/github.com/thinca/vim-themis/bin:$PATH # for vim-themis
export PATH=$HOME/node_modules/.bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/google-cloud-sdk/bin/:$PATH
export PATH=/usr/local/opt/php@8.1/bin:$PATH
export GOPATH=$HOME
export THEMIS_HOME=$HOME/src/github.com/thinca/vim-themis # for vim-themis

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

autoload -U colors && colors
PS1="[%?]%{$bg[blue]%}%n@%m %~ %{$reset_color%}%% "
# PS1="[%?]\u001b[%(?.44m.41m)%n@%m %~ %{$reset_color%}%% "

# source /usr/local/opt/spaceship/spaceship.zsh


# paths for popular directries
export V=~/.vim/pack/devplugins/start
export G=~/src/github.com/cowsys


# alias setting
alias ls="ls -G -w"
alias ll="ls -la"
alias l.="ls -la ../"
alias ll.="pecol."

alias du="du -h"
alias df="df -h"

alias h1="head -n1"

alias vim="nvim"
alias vi='nvim'
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
alias -g P="| peco"
alias -g H="head -n1"
alias -g HH="head -n5"
alias -g T="tail -n1"
alias -g TT="tail -n5"


alias ghqq=ghqq
alias vh=vimcd
alias gh=ghqcd
alias ghh=ghqcd2
alias ghhh=ghqcd3
alias cc=pecocd
alias dd="cd $HOME/src/github.com/cowsys/codepocket"
alias ddd=pecocodepocket
alias lll=pecoll
alias lk=pecollcodepocket
alias mr=mrun
alias c=colorize_stderr

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

function ghqq() {
    export GHQ_ROOT=~/ro-src/
    ghq get $@
    export GHQ_ROOT=
}

function mkc() {
    mkdir "$@" && cd "$@"
}
function pecocd() {
    local found="$( find . -maxdepth 3 -type d ! -path "*/.*" | sort -r | peco )"
    cd "$found"
}

function pecoll() {
    local found="$(ls -d1 */ | sort -r | peco )"

    echo "$PWD/$found"

    ls -la "$PWD/$found"
}

function pecol.() {
    local found="$(ls -d1 ../* | sort -r | peco )"

    echo "$PWD/$found"

    ls -la "$PWD/$found"
}

function pecollcodepocket() {
    TARGET_PATH=$HOME/src/github.com/cowsys/codepocket
    # local found="$(ls -d1 $TARGET_PATH | sort -r | peco )"
    local found="$( find $TARGET_PATH -maxdepth 1 -type d ! -path "*/.*" | cut -d / -f 8,9 | sort -r | peco )"

    echo "$TARGET_PATH/$found"

    ls -la "$TARGET_PATH/$found"
}

function pecocodepocket() {
    TARGET_PATH=$HOME/src/github.com/cowsys/codepocket
    local found="$( find $TARGET_PATH -maxdepth 1 -type d ! -path "*/.*" | cut -d / -f 8,9 | sort -r | peco )"
    cd "$TARGET_PATH/$found"
}
function vimcd() {
    local found="$( find $HOME/.vim -maxdepth 4 -type d | peco )"
    cd "$found"
}
function ghqcd() {
    local found="$( find $HOME/src/github.com/cowsys -maxdepth 1 -type d ! -path "*/.*" | peco )"
    cd "$found"
}
function ghqcd2() {
    local found="$( find $HOME/src -maxdepth 3 -type d ! -path "*/.*" | peco )"
    cd "$found"
}

function ghqcd3() {
    local found="$( find $HOME/ro-src -maxdepth 3 -type d ! -path "*/.*" | peco )"
    cd "$found"
}
function vcd() {
    TARGET_PATH=$HOME/.vim/pack/devplugins/start
    local found="$( find $TARGET_PATH -maxdepth 3 -type d | cut -d / -f 8,9 | peco )"
    cd "$TARGET_PATH/$found"
}

function mrun() {
    local found="$( cat Makefile | grep "^\w" | tr -d : | peco )"
    make "$found"
}

function lman() {
    man -M ~/src/github.com/cowsys/linux-doc/man/usrshareman/ "$@"
}
function lman2() {
    man -M ~/src/github.com/cowsys/linux-doc/man/usrlocalshareman/ "$@"
}
function pman() {
    man -M ~/src/github.com/cowsys/linux-doc/man/posix/ "$@"
}

if [ -n "$NVIM" ]; then
    if [ -x "$(command -v nvr)" ]; then
        alias nvim=nvr
    else
        alias nvim='echo "No nesting!"'
    fi
fi

# search history by peco
function peco-select-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$( fc -l ${FIRST} | LC_ALL=C sort -k 2 -k 1nr | LC_ALL=C uniq -f 1 |  LC_ALL=C sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ] ; then
    # Replace the last entry, "peco-history", with $CMD
    history -s $CMD

    if type osascript > /dev/null 2>&1 ; then
      # Send UP keystroke to console
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi

    # Uncomment below to execute it here directly
    # echo $CMD >&2
    # eval $CMD
  else
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
  fi
}

colorize_stderr()(set -o pipefail;"$@" 2> >(sed $'s,.*,\e[31m&\e[m,'>&2))
