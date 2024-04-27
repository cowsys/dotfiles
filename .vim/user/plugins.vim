set nocompatible
filetype plugin indent on


packadd minpac
call minpac#init()


" base
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('mattn/ctrlp-matchfuzzy')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('fuenor/qfixgrep')
call minpac#add('thinca/vim-qfreplace')
call minpac#add('thinca/vim-quickrun')
call minpac#add('vim-scripts/batch.vim')

" display
call minpac#add('fatih/molokai')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('itchyny/lightline.vim')
" call minpac#add('mattn/emoji-vim')
call minpac#add('kannokanno/previm')
call minpac#add('img-paste-devs/img-paste.vim')
call minpac#add('aklt/plantuml-syntax')
call minpac#add('tyru/open-browser.vim')
" call minpac#add('rhysd/github-complete.vim')
call minpac#add('thinca/vim-visualstar')
call minpac#add('t9md/vim-quickhl')

" syntax/error check
" call minpac#add('scrooloose/syntastic')
call minpac#add('dense-analysis/ale')
call minpac#add('maximbaz/lightline-ale')
call minpac#add('jceb/vim-hier') " Highlight quickfix errors

" lsp
"call minpac#add('prabirshrestha/async.vim')
call minpac#add('prabirshrestha/asyncomplete.vim')
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('mattn/vim-lsp-settings')

" snippets
call minpac#add('hrsh7th/vim-vsnip')
call minpac#add('hrsh7th/vim-vsnip-integ')
call minpac#add('rafamadriz/friendly-snippets')

" input
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
" call minpac#add('tpope/vim-abolish')
call minpac#add('kana/vim-smartchr')
call minpac#add('kana/vim-smartinput')
" call minpac#add('mattn/emmet-vim')
call minpac#add('AndrewRadev/switch.vim') "toggle some symbol
call minpac#add('vim-scripts/Align')
call minpac#add('tomtom/tcomment_vim')

" operator
call minpac#add('kana/vim-operator-user')
" call minpac#add('osyo-manga/vim-operator-search')
" call minpac#add('kana/vim-operator-replace')

" textobj
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-function')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-line')
call minpac#add('saaguero/vim-textobj-pastedtext')
call minpac#add('fvictorio/vim-textobj-backticks')
call minpac#add('mattn/vim-textobj-url')
call minpac#add('thinca/vim-textobj-between')


" git
call minpac#add('tpope/vim-fugitive')
call minpac#add('gregsexton/gitv')


" langs
call minpac#add('thinca/vim-themis')
call minpac#add('mattn/vim-goimports')
call minpac#add('buoto/gotests-vim')
call minpac#add('sebdah/vim-delve')
call minpac#add('kyoh86/vim-go-coverage')
call minpac#add('rhysd/vim-clang-format')
" call minpac#add('tpope/vim-dispatch')

" call minpac#add('thinca/vim-ambicmd')
call minpac#add('HiPhish/info.vim')
call minpac#add('yuratomo/w3m.vim')
call minpac#add('rhysd/clever-f.vim')

call minpac#add('makerj/vim-pdf')
" call minpac#add('vim-test/vim-test')

" call minpac#add('ellisonleao/glow.nvim', {'type': 'opt'})
" call minpac#add('brglng/vim-im-select')
" call minpac#add('yoshida-m-3/vim-im-select')
" call minpac#add('thinca/vim-ref')


packloadall
