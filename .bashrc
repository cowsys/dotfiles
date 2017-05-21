export GOPATH=$HOME
#export PATH=$PATH:$GOPATH/bin/go_appengine:$GOPATH/bin
export PATH=/usr/local/bin:$PATH:$GOPATH/bin/go_appengine:$GOPATH/bin
# tmuxでvimの色付けされない問題(http://qiita.com/sutoh/items/296b1277b00beae87106)
export TERM=xterm-256color
export HISTSIZE=50000

GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
export PS1='\h\[\033[00m\]:\W\[\033[31m\]\n$(__git_ps1 [%s])\[\033[00m\]\$ '

alias ll='ls -la'
alias  v='vim'
alias ccd='pecocd'
#alias ddc='pecobcd'
alias gh='ghcd'
alias gb='git branch'
alias gc='git checkout'
alias gs='git status'
alias gp='git pull'


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
    local found="$( find . -maxdepth 6 -type d ! -path "*/.*" | peco )"
    cd "$found"
    ###local dir="$( find . -type d -maxdepth 3 -name '.*' -prune -or -not -name '.*' | peco )"
    ###if [ ! -z "$dir" ] ; then
    ###    cd "$dir"
    ###fi
}
#function pecobcd {
#    local found="$(cd ../../../../../; find . -maxdepth 6 -type d ! -path "*/.*" | peco )"
#    cd "$found"
#}

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
bind -x '"\C-r": peco-select-history'
