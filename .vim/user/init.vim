set nocompatible
filetype plugin indent on


packadd minpac
call minpac#init()


" base
call minpac#add('editorconfig/editorconfig-vim') " enable EditorConfig
call minpac#add('kien/ctrlp.vim')
call minpac#add('Lokaltog/vim-easymotion')
call minpac#add('fuenor/qfixgrep')
call minpac#add('thinca/vim-qfreplace')
call minpac#add('thinca/vim-quickrun')
call minpac#add('Shougo/vimproc.vim', {'do': 'silent! !make'})
call minpac#add('prabirshrestha/async.vim')

" display
call minpac#add('fatih/molokai')
call minpac#add('mattn/emoji-vim')
call minpac#add('kannokanno/previm')
call minpac#add('aklt/plantuml-syntax')

call minpac#add('rhysd/github-complete.vim')

call minpac#add('thinca/vim-visualstar')
call minpac#add('t9md/vim-quickhl')


" syntax/error check
call minpac#add('scrooloose/syntastic')
call minpac#add('jceb/vim-hier') " Highlight quickfix errors

" completion
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('natebosch/vim-lsc')
call minpac#add('prabirshrestha/asyncomplete.vim')
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')

" input
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-abolish')
call minpac#add('kana/vim-smartchr')
call minpac#add('kana/vim-smartinput')
call minpac#add('mattn/emmet-vim')
call minpac#add('AndrewRadev/switch.vim') "toggle some symbol
call minpac#add('h1mesuke/vim-alignta')
call minpac#add('tomtom/tcomment_vim')


" operator
call minpac#add('osyo-manga/vim-operator-search')
call minpac#add('kana/vim-operator-user')
call minpac#add('kana/vim-operator-replace')


" textobj
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-function')
call minpac#add('kana/vim-textobj-entire')


" git
call minpac#add('tpope/vim-fugitive')
call minpac#add('gregsexton/gitv')


" langs
call minpac#add('fatih/vim-go')
call minpac#add('leafgarland/typescript-vim')
