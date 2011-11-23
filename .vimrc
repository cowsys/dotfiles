""" vundle
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" original repos on github
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-surround'

" vim-scripts repos
Bundle 'vcscommand.vim'
Bundle 'YankRing.vim'
""" bundleと相性がわるいようなのでコメントアウト
"Bundle 'Align.vim'
"Bundle 'ShowMarks'
Bundle 'confluencewiki.vim'

" etc
Bundle 'bufexplorer.zip'


filetype plugin indent on

set expandtab
set tabstop=4

set nobackup
set noswapfile

" 常に行数を表示する
set nu

" input date
:noremap! <F5> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M:%S')<CR>a

" share copy buffer
:set clipboard=unnamed

" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m

" ヘルプ検索順序を日本語->英語に設定
:set helplang=ja

" モードの違いをステータスライン色で表現
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray   gui=none ctermfg=Blue ctermbg=Yellow cterm=none

" 不可視文字表示設定
""" tab, 行末space
set list listchars=tab:>-,trail:_
""" 全角space
scriptencoding utf-8
augroup highlightIdegraphicSpace
    autocmd!
    autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
colorscheme elflord


" ファイル保存時に構文チェックを行う
""" for php
augroup phpsyntaxcheck
    autocmd!
    autocmd BufWrite *.php w !php -l
augroup END

" vimgrep検索時、cwオプション無しでQuickFixウィンドウで開く
augroup grepopen
    autocmd!
    autocmd QuickfixCmdPost vimgrep cw
augroup END


" yankring historyファイルの場所設定
let g:yankring_history_dir = expand('$HOME'). '/.vim'
let g:yankring_history_file = '.yankring_history'

" command mode 時 tcsh風のキーバインドに
cmap <C-A> <Home>
cmap <C-F> <Right>
cmap <C-B> <Left>
cmap <C-D> <Delete>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>
