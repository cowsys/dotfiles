# macOS builtin shell is obsolete, so use newer one.
if [ -a /usr/local/bin/bash ]; then
    /usr/local/bin/bash
fi
# bash_profileの読み込み時にbash設定を適用させる
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
