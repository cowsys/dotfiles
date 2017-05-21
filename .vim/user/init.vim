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
NeoBundle 'fatih/molokai'

NeoBundle 'fuenor/qfixgrep'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'jceb/vim-hier'
NeoBundle 'mattn/emoji-vim'

NeoBundle 'Lokaltog/vim-easymotion'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'AndrewRadev/switch.vim'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'osyo-manga/vim-operator-search'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'

NeoBundle 'h1mesuke/vim-alignta'
" コメント(http://qiita.com/alpaca_taichou/items/211cd62bee84c59ca480)
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'koron/codic-vim'
NeoBundle 'vim-scripts/gtags.vim'

""" go {{{
" filetype判定してるようなのでlazyしない
NeoBundle 'fatih/vim-go'
NeoBundleLazy 'dgryski/vim-godef', {
            \ 'autoload' : { 'filetypes' : 'go'  }
            \ }
""" }}}

""" in testing {{{
""" }}}

""" useless??? {{{
NeoBundle 'tpope/vim-repeat'
"NeoBundle 'taku-o/vim-toggle'
"NeoBundle 'nathanaelkane/vim-indent-guides'
""" }}}
" }}
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""" }}}


