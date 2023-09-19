export GOPATH=$HOME
export PATH=/usr/local/bin:$PATH:$HOME/google-cloud-sdk/bin
# tmuxでvimの色付けされない問題(http://qiita.com/sutoh/items/296b1277b00beae87106)
export TERM=xterm-256color
export HISTSIZE=500000

# GIT_PS1_SHOWUPSTREAM=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWSTASHSTATE=true
# export PS1='\h\[\033[00m\]:\W\[\033[31m\]\n$(__git_ps1 [%s])\[\033[00m\]\$ '

alias ll='ls -la'
# alias v='nvim'
# alias vim='nvim'
alias ccd='pecocd'
alias pp='peco-select-history'
alias gh='ghcd'
alias gb='git branch'
alias gc='git checkout'
alias gs='git status'
alias gp='git pull'

alias vim="nvim"
alias v='nvim'
alias vv='nvim +te'
alias vr='nvim -R'


# ### 仮想端末のコマンド履歴を共有 {{{
# function share_history {
#     history -a
#     history -c
#     history -r
# }
# PROMPT_COMMAND='share_history'
# shopt -u histappend
# ### }}}

function pecocd {
    local found="$( find . -maxdepth 3 -type d ! -path "*/.*" | sort -r | peco )"
    cd "$found"
}

function ghcd {
    local dir="$( find $HOME/src/*/* -type d -maxdepth 1 | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

# search history by peco(http://www.fisproject.jp/2015/01/peco/)
peco-select-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$( fc -l ${FIRST} | LC_ALL=C sort -k 2 -k 1nr | LC_ALL=C uniq -f 1 |  LC_ALL=C sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  echo  "---$CMD---"
# -n string
#        True if the length of string is non-zero.
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
# bind -x '"\C-r": peco-select-history'


# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
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


# bind -x '"\C-r": peco-select-history'
# bind '"\C-r": previous-history'
# bind '"\C-n": previous-history'
# # bind '"\C-p": next-history'
bind '"\C-o": previous-history'
