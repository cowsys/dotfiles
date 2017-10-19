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


""""""enable neocomplete(https://github.com/Shougo/neocomplete.vim) {{{
let g:neocomplete#enable_at_startup = 1
"""""" }}}

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
" let g:go_auto_type_info = 1
""" }}}
""" for syntastic*go lint check(https://github.com/fatih/vim-go "using with syntastic") {{{
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = "goimports"
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
let g:ctrlp_extensions = ['dir']
let g:ctrlp_cmd = 'CtrlPCurWD'

" カレントバッファのルートディレクトリを基準に検索
nnoremap <C-l> :CtrlPRoot<Esc>

" ignore dirs
let g:ctrlp_custom_ignore = '\v[\/](node_modules|cloud.google.com|github.com|goji.io|golang.org|google.golang.org|googlemaps.github.io)$'
""" }}}


" for denite.vim {{{

" }}}

"""""" install test {{{
""" refer go source (http://suzuken.hatenablog.jp/entry/2015/10/23/160503) {{{
nmap gs <Plug>(go-def-split)
nmap gr <Plug>(go-referrers)
nmap ggc <Plug>(go-callers)
""" }}}

""" highlight err(http://yuroyoro.hatenablog.com/entry/2014/08/12/144157) {{{
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
""" }}}
""" highlight channels {{{
autocmd FileType go :highlight goChan cterm=bold ctermfg=214
autocmd FileType go :match goChan /\<\<-\>/
""" }}}
"""""" }}}




""""""" for gvim {{{
""" input date {{{
:noremap! <F4> ===============
:noremap! <F5> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M')<CR>a
""" }}}


" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m
""""""" }}}



""" vim-smartchr(http://d.hatena.ne.jp/ampmmn/20080925/1222338972 {{{
inoremap <expr> , smartchr#one_of(',', ' <- ')
inoremap <expr> . smartchr#one_of('.', '->')
inoremap <expr> ; smartchr#one_of(';', ' := ')
inoremap <expr> j smartchr#one_of('j', '_')
""" }}}



""" qfixgrep(https://sites.google.com/site/fudist/Home/grep/usage) {{{
let MyGrep_ExcludeReg = '[~#]$\|\.md$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]svn[/\\][/\\]git[/\\]'
" QFixGrepの検索時にカーソル位置の単語を拾う/拾わない
let MyGrep_DefaultSearchWord = 1
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

"nmap <Leader>ww :<C-u>Ref webdict w<Space>
nmap ,rr :<C-u>Ref webdict w<Space>

""" 開いていた箇所に飛ぶ(http://advweb.seesaa.net/article/13443981.html) {{{
augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" | endif
augroup END
""" }}}


""" tagbar toggle(https://github.com/majutsushi/tagbar) {{{
nnoremap <Space>f :<C-u>TagbarToggle<CR>
""" }}}


""" () {{{
" 1 : QuickFix/ロケーションリストの両方で有効
let QFixWin_EnableMode = 1
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 0
""" }}}

""" fugitiveでvertical diffをデフォルトで利用する(https://github.com/tpope/vim-fugitive/issues/508) {{{
set diffopt+=vertical
""" }}}


""" Yで行末までコピー(http://ymizushi.hateblo.jp/entry/2012/11/18/232431) {{{
nnoremap Y y$
""" }}}

""" fとtを入れ替える {{{
"nnoremap f t
"nnoremap t f
"nnoremap F T
"nnoremap T F
""" }}}

""" zzとztを入れ替える {{{
nnoremap zz zt
""" }}}

""" for neosnippet(https://github.com/Shougo/neosnippet.vim) {{{
" Plugin key-mappings.
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


let g:go_snippet_engine = "neosnippet"
""" }}}

""" for switch(https://github.com/AndrewRadev/switch.vim) {{{
let g:switch_mapping = "-"
""" }}}

""" undoファイルを作成しないようにする (http://www.kaoriya.net/blog/2014/03/30/) {{{
:set noundofile
""" }}}

""" tabを開く {{{
ca tt tabnew
""" }}}

""" カレントウィンドウを新規タブで開き直す(http://d.hatena.ne.jp/m1204080/20101025/1288028786) {{{
" if v:version >= 700
"     nnoremap <C-m> :call OpenNewTab()<CR>
"     function! OpenNewTab()
"         let f = expand("%:p")
"         execute ":q"
"         execute ":tabnew ".f
"     endfunction
" endif
""" }}}


"" replace grep with ripgrep(http://wakame.hatenablog.jp/entry/2017/05/04/144550) {{{
if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif
"" }}}


""" replace grep to ripgrep(http://www.wezm.net/technical/2016/09/ripgrep-with-vim/) {{{
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
""" }}}

""" (template) {{{
let g:deoplete#enable_at_startup = 1
""" }}}

""" (template) {{{
""" }}}
