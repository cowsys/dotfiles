export GOPATH=$HOME
export PATH=$HOME/bin:$PATH
export PATH=$HOME/tmp/bin:$PATH
export PATH=$HOME/src/github.com/thinca/vim-themis/bin:$PATH # for vim-themis
# export PATH=/usr/local/bin:$PATH:$HOME/google-cloud-sdk/bin

export HISTSIZE=500000
# ANSI escape codes: https://saturncloud.io/blog/how-to-print-colored-text-to-the-terminal/
export PS1='[$?]\[\033[44m\][j:\j] \h@\u: \W \[\033[00m\]\n\$ '

# GIT_PS1_SHOWUPSTREAM=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWSTASHSTATE=true
# export PS1='\h\[\033[00m\]:\W\[\033[31m\]\n$(__git_ps1 [%s])\[\033[00m\]\$ '

alias ll='ls -la'
alias diff="colordiff"
alias sed="gsed"

alias ccd='pecocd'
alias pp='peco-select-history'
alias gh='ghcd'
alias gb='git branch'
alias gc='git checkout'
alias gs='git status'
alias gp='git pull'


alias vim='nvim'
alias v='nvim'
alias vv='nvim +te'
alias vr='nvim -R'

alias gd='go doc'
alias ge='goex'


### 仮想端末のコマンド履歴を共有 {{{
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
### }}}

function pecocd {
    local found
    found="$( find . -maxdepth 3 -type d ! -path "*/.*" | sort -r | peco )"
    cd "$found"
}

function ghcd {
    local dir
    dir="$( find $HOME/src/*/* -type d -maxdepth 1 | peco )"
    if [ -n "$dir" ] ; then
        cd "$dir"
    fi
}

peco-select-history() {
    local FIRSTLINE_NO=1
    local CMD
    CMD=$( fc -l ${FIRSTLINE_NO} | \
        sort -k 2 -k 1nr | \
        uniq -f 1 | \
        sort -nr | \
        sed -E 's/^[0-9]+[[:blank:]]+//' | \
        peco | head -n 1)
    if [ -n "$CMD" ] ; then
        READLINE_LINE="$CMD"
    fi
}
bind -x '"\C-r": peco-select-history'


# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
# eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'


# configs below are defined by ANSI escape codes
# https://chrisyeh96.github.io/2020/03/28/terminal-colors.html
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[33;41m'
export LESS_TERMCAP_se=$'\e[39;49m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# don't permit to open nvim inside nvim
# ref: practical vim p90
# "Using a Shell Alias to Prevent Accidental Nesting"
if [ -n "$NVIM" ]; then
    if [ -x "$(command -v nvr)" ]; then
        alias nvim=nvr
    else
        alias nvim='echo "No nesting!"'
    fi
fi


function pet-select() {
  # to use READLINE_* vars,
  # you need to use newer bash than macOS builtin bash.
  BEFORE_READLINE_LINE=$READLINE_LINE
  BUFFER=$(pet search --query "")
  READLINE_LINE="$BEFORE_READLINE_LINE $BUFFER"
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'


function copy-line() {
  echo -n "$READLINE_LINE" | pbcopy
}
bind -x '"\C-x\C-e": copy-line'
