export PATH=~/Library/Python/3.7/bin:~/bin:/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export GOPATH=$HOME

GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true

#export PROMPT="$PROMPT $(git-radar --zsh --fetch) "

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mollifier/anyframe"
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-completions"

# Then, source plugins and add commands to $PATH
zplug load --verbose

#autoload -Uz compinit && compinit


# alias setting
alias ls="ls -G -w"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias vim="nvim"
alias v='nvim'
alias vv='nvim -R'

alias diff="colordiff"

alias gb='git branch'
alias gs='git status'
alias gp='git pull'

alias gbb=anyframe-widget-checkout-git-branch

## global alias
alias -g V-=' | nvim -'

# alias gh=peco-src
alias gh=anyframe-widget-cd-ghq-repository


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


# 補完機能
#autoload -U compinit
#compinit


# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
#bindkey '^b' anyframe-widget-checkout-git-branch
bindkey '^xg' anyframe-widget-cd-ghq-repository


## hook direnv
eval "$(direnv hook zsh)"
