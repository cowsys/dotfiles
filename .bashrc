export GOPATH=$HOME
#export PATH=$PATH:$GOPATH/bin/go_appengine:$GOPATH/bin
export PATH=/usr/local/bin:$PATH:$GOPATH/bin/go_appengine:$GOPATH/bin
# tmuxでvimの色付けされない問題(http://qiita.com/sutoh/items/296b1277b00beae87106)
export TERM=xterm-256color


alias ll='ls -la'
alias  v='vim'
alias cd='cd'
alias gh='ghcd'


###function pecocd {
###    local dir="$( find . -type d -maxdepth 3 -name '.*' -prune -or -not -name '.*' | peco )"
###    if [ ! -z "$dir" ] ; then
###        cd "$dir"
###    fi
###}

function ghcd {
    local dir="$( find $HOME/src/*/* -type d -maxdepth 1 | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

# search history by peco(http://www.fisproject.jp/2015/01/peco/)
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
    # for OSX
    if [ `uname` = "Darwin" ]; then
        ${READLINE_LINE}
    fi
}
bind -x '"\C-r": peco-select-history'
