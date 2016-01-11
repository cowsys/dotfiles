export GOPATH=$HOME
export PATH=~/go_appengine:$PATH:$GOPATH/bin
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
