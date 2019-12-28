set nocompatible
filetype plugin indent on


""" neobundle(https://github.com/Shougo/neobundle.vim) {{{
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible  " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here: {{
"" install&auto update vimproc
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }


" base
NeoBundle 'editorconfig/editorconfig-vim' " enable EditorConfig
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'


" display
NeoBundle 'fatih/molokai'
NeoBundle 'mattn/emoji-vim'
NeoBundle 'kannokanno/previm'

NeoBundle 'thinca/vim-visualstar'
NeoBundle 't9md/vim-quickhl'


" syntax/error check
NeoBundle 'scrooloose/syntastic'
NeoBundle 'jceb/vim-hier' " Highlight quickfix errors


" input
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'AndrewRadev/switch.vim' "toggle some symbol
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'tomtom/tcomment_vim'


" operator
NeoBundle 'osyo-manga/vim-operator-search'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'


" textobj
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-textobj-entire'


" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'


""" go {{{
NeoBundle 'fatih/vim-go'
" filetype判定してるようなのでlazyしない
" NeoBundleLazy 'dgryski/vim-godef', {
"             \ 'autoload' : { 'filetypes' : 'go'  }
"             \ }
""" }}}


" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""" }}}
