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

" non github repos


filetype plugin indent on

colorscheme elflord
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
