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

NeoBundle 'Lokaltog/vim-easymotion'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'thinca/vim-ref'

NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'

NeoBundle 'h1mesuke/vim-alignta'
" コメント(http://qiita.com/alpaca_taichou/items/211cd62bee84c59ca480)
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'koron/codic-vim'

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


""" for go autocompletion {{{
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
""" }}}


"""""" basic setting {{{
colorscheme molokai
syntax on
set nu
set autoindent
set hlsearch
set cursorline

filetype on

set expandtab
set ts=4
set shiftwidth=4

""""""set noexpandtab
""""""set tabstop=4
""""""set shiftwidth=4

set nobackup
set noswapfile

" omni補完を有効にする
set omnifunc=syntaxcomplete#Complete
" omni詳細な補完内容を表示
set completeopt=menu,preview

nnoremap q :<C-u>q<CR>
nnoremap Q q

noremap ; :
noremap : ;
"""""" }}}

""" status line {{{
" モードの違いをステータスライン色で表現
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray   gui=none ctermfg=Blue ctermbg=Yellow cterm=none

" ステータスラインに文字コードと改行コードを表示(http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese#TOC-7
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
""" }}}
"""""" for Gitv-diff-folding(http:/cohama.hateblo.jp/entry/20120417/1334679297) {{{
autocmd FileType git :setlocal foldlevel=99
""" }}}

""" keybinds {{{
" command mode 時 tcsh風のキーバインドに
cmap <C-A> <Home>
cmap <C-F> <Right>
cmap <C-B> <Left>
cmap <C-D> <Delete>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>

" ノーマルモートでもエンターキーで改行を挿入(http://blog.blueblack.net/item_317) {{{
noremap <CR> o<ESC>

" ビジュアルモードでインデントを行う
vnoremap < <gv
vnoremap > >gv
""" }}}

"""""" for japanese input(https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control) {{{
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)


" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>


 "カーソル一文字単位移動
inoremap <silent> <C-f> <Left>
inoremap <silent> <C-b> <Right>


"単語単位移動（行末で止まる必要がない場合）
inoremap <silent> <C-w> <S-Left>
inoremap <silent> <C-d> <S-Right>

 "
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>

"非補完時は行移動をj,kと同じ動作にして補完中は候補選択
"inoremap <C-n> <Down>
"inoremap <C-p> <Up>

"カーソル前の文字削除
inoremap <silent> <BS>  <C-g>u<BS>
inoremap <silent> <C-h> <C-g>u<C-h>
"カーソル後の文字削除
inoremap <silent> <Del> <C-g>u<Del>
inoremap <silent> <C-g> <C-g>u<Del>


"最後に挿入した文字列を挿入
inoremap <silent> <C-z> <C-g>u<C-a>

"現在行をインデント
inoremap <silent> <Tab>   <C-g>u<C-t>
inoremap <silent> <S-Tab> <C-g>u<C-d>
""""""  }}}


""""""for quickrun {{{
""" quickrun*vimproc(http://d.hatena.ne.jp/osyo-manga/20130311/1363012363) {{{
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" updatetime が一時的に書き換えられてしまうので注意して下さい
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}
""" }}}


""" quickrun*go{{{
let g:quickrun_config.go = {
    \'command': 'go',
\}
""" }}}
"""""" }}}

""" for fugitive(http://vim-users.jp/2011/06/hack219/) {{{
nnoremap <Space>gd :<C-u>Gvdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
""" }}}


""" for vim-go(https://github.com/fatih/vim-go) {{{
" display auto type info
let g:go_auto_type_info = 1
""" }}}
""" for syntastic*go lint check(https://github.com/fatih/vim-go "using with syntastic") {{{
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
""" }}}


""" for vim-easymotion(http://blog.remora.cx/2012/08/vim-easymotion.html {{{
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjlasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVBk'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
""" }}}


""" for ctrlp(http://kien.github.com/ctrlp.vim/ {{{
let g:ctrlp_map = '<c-k>'
let g:ctrlp_extensions = ['line']
""" }}}


"""""" install test {{{
""" refer go source (http://suzuken.hatenablog.jp/entry/2015/10/23/160503) {{{
nmap gs <Plug>(go-def-split)
""" }}}

""" highlight err(http://yuroyoro.hatenablog.com/entry/2014/08/12/144157) {{{
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
""" }}}
"""""" }}}




""""""" for gvim {{{
""" input date {{{
:noremap! <F1> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M')<CR>a
:noremap! <F2> <ESC>:execute 'normal a'.strftime('%H:%M')<CR>a
""" }}}

" share copy buffer
:set clipboard=unnamed

" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m
""""""" }}}



""" vim-smartchr(http://d.hatena.ne.jp/ampmmn/20080925/1222338972 {{{
inoremap <expr> . smartchr#one_of('.', '->')
""" }}}



""" qfixgrep {{{
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]svn[/\\][/\\]git[/\\]'
""" }}}


" ctrlp(http://kien.github.com/ctrlp.vim/ {{{
let g:ctrlp_map = '<c-k>'
" }}}


let g:ref_source_webdict_sites = {
\   'w': {
\     'url': 'http://ejje.weblio.jp/content/%s',
\   },
\ }


let g:ref_source_webdict_sites.default = 'w'

function! g:ref_source_webdict_sites.w.filter(output)
    return join(split(a:output, "\n")[81 :], "\n")
endfunction

nmap <Leader>ww :<C-u>Ref webdict w<Space>
