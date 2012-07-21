export LANG=ja_JP.UTF-8
export SANDBOX_HOME=$HOME/mysql-sandbox

# key bind
bindkey -e

# auto_cd&pushd
setopt auto_cd
setopt auto_pushd

# history setting
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history    # share command history data

# comp setting
autoload -U compinit
compinit

# prompt setting

case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac


case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# alias setting
alias ls="ls -G -w"
alias la="ls -aF"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias v='vim'
alias vv='vim -R'

alias log='cd ~/00log'
alias work='cd ~/00work'
alias src='cd ~/src'


## global alias
alias -g V-=' | vim -'
