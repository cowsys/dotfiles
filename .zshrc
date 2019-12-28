# alias setting
alias ls="ls -G -w"
alias la="ls -aF"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias v='vim'
alias vv='vim -R'


## global alias
alias -g V-=' | vim -'


function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection


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


GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
export PS1='\h\[\033[00m\]:\W\[\033[31m\]\n$(__git_ps1 [%s])\[\033[00m\]\$ '
