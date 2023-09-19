# bash_profileの読み込み時にbash設定を適用させる
if [ -f ~/.bashrc ]; then
     . ~/.bashrc
fi

# if [ -f ~/.corpbashrc ]; then
#      . ~/.corpbashrc
# fi
#
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#     . `brew --prefix`/etc/bash_completion
# fi
