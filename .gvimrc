:colorscheme molokai

" share copy buffer
:set clipboard=unnamed

" 挿入モードを抜けるときにファイルを保存
augroup autosave 
    autocmd!
    autocmd InsertLeave *.md w
augroup END
