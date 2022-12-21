colorscheme molokai

set guifont=Osaka-Mono:h22

" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m

" share copy buffer
set clipboard=unnamed

" 挿入モードを抜けるときにファイルを保存
augroup autosave 
    autocmd!
    autocmd InsertLeave *.md w
augroup END

" input date
:noremap! <F4> ===============
:noremap! <F5> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M')<CR>a

" use template(https://qiita.com/saba1024/items/e2a057e8a41a6f89cac8)
" autocmd BufNewFile *.log  0r ~/path/to/template.log

" set default directory
"cd ~/path/to/default/director
