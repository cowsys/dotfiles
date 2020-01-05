""" basic setting {{{
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

set nobackup
set noswapfile

" omni補完を有効にする
set omnifunc=syntaxcomplete#Complete
" omni詳細な補完内容を表示
set completeopt=menu,preview

""" undoファイルを作成しないようにする (http://www.kaoriya.net/blog/2014/03/30/) {{{
:set noundofile
""" }}}

" nnoremap q :<C-u>q<CR>
" nnoremap Q q

noremap ; :
noremap : ;
""" }}}

""" status line {{{
" モードの違いをステータスライン色で表現
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray   gui=none ctermfg=Blue ctermbg=Yellow cterm=none

" ステータスラインに文字コードと改行コードを表示(http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese#TOC-7
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
""" }}}

""" keybinds {{{
" ノーマルモートでもエンターキーで改行を挿入(http://blog.blueblack.net/item_317) {{{
noremap <CR> o<ESC>

" tabを開く
"ca tt tabnew

" 検索時にカーソル移動しない(https://ysano2005.hatenadiary.org/entry/20070313/1173770637)
nmap * *N
nmap # #N

" Yで行末までコピー(http://ymizushi.hateblo.jp/entry/2012/11/18/232431)
nnoremap Y y$

nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
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

""" for fugitive(http://vim-users.jp/2011/06/hack219/) {{{
nnoremap <Space>gd :<C-u>Gvdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

" vertical diffをデフォルトで利用する(https://github.com/tpope/vim-fugitive/issues/508)
set diffopt+=vertical
""" }}}

""" for Gitv-diff-folding(http:/cohama.hateblo.jp/entry/20120417/1334679297) {{{
autocmd FileType git :setlocal foldlevel=99
""" }}}


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


""" for vim-go(https://github.com/fatih/vim-go) {{{
display auto type info
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']
""" }}}

""" for syntastic*go lint check(https://github.com/fatih/vim-go "using with syntastic") {{{
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = "goimports"
""" }}}

"""" highlight err(http://yuroyoro.hatenablog.com/entry/2014/08/12/144157) {{{
"autocmd FileType go :highlight goErr cterm=bold ctermfg=214
"autocmd FileType go :match goErr /\<err\>/
"""" }}}
"""" highlight channels {{{
"autocmd FileType go :highlight goChan cterm=bold ctermfg=214
"autocmd FileType go :match goChan /\<\<-\>/
"""" }}}


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

""" for japanese input(https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control) {{{
" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
"inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
"""  }}}

""" vim-smartchr(http://d.hatena.ne.jp/ampmmn/20080925/1222338972 {{{
inoremap <expr> ; smartchr#one_of(';', ' := ')
""" }}}

""" qfixgrep(https://sites.google.com/site/fudist/Home/grep/usage) {{{
let MyGrep_ExcludeReg = '[~#]$\|\.md$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]svn[/\\][/\\]git[/\\]'
" QFixGrepの検索時にカーソル位置の単語を拾う/拾わない
let MyGrep_DefaultSearchWord = 1
""" }}}

""" customize quickhl color setting(http://engineerspirit.com/2016/12/29/post-570/) {{{
let g:quickhl_manual_colors = [
  \ "gui=bold ctermfg=16   ctermbg=1  guifg=#ffffff guibg=#0a7383",
  \ "gui=bold ctermfg=000  ctermbg=3  guibg=#a07040 guifg=#ffffff",
  \ "gui=bold ctermfg=16   ctermbg=5  guibg=#4070a0 guifg=#ffffff",
  \ "gui=bold ctermfg=000  ctermbg=6  guibg=#40a070 guifg=#ffffff",
  \ "gui=bold ctermfg=16   ctermbg=4  guibg=#40a070 guifg=#ffffff",
  \ ]
""" }}}

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

""" for switch(https://github.com/AndrewRadev/switch.vim) {{{
let g:switch_mapping = "-"
""" }}}

""" (previm) {{{
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
""" }}}

""" yaml indent() {{{
"Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
""" }}}

if executable('jq')
  function! s:jq(...)
    execute '%!jq' (a:0 == 0 ? '.' : a:1)
  endfunction
  command! -bar -nargs=? Jq  call s:jq(<f-args>)
endif

""" (enable golsp) {{{
let g:lsp_async_completion = 1

if executable('golsp')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif
""" }}}

""" preview plantuml {{{
au FileType plantuml command! OpenUml :!open -a Google\ Chrome %
""" }}}



""" for nvim {{{
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>

    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
""" }}}



""" (template) {{{
""" }}}
