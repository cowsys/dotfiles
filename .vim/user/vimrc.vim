" reference: map-table from :h map-table
" 							*map-table*
"          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
" Command        +------+-----+-----+-----+-----+-----+------+------+ ~
" [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
" n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
" [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
" i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
" c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
" v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
" x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
" s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
" o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
" t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
" l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |


""" basic setting {{{
" colorscheme molokai
colorscheme solarized
syntax on
set nu
set autoindent
set hlsearch
set cursorline
set tildeop " ~ behaves as an operator

filetype on

set expandtab
set ts=4
set shiftwidth=4

" open new window on right side
set splitright

set nobackup
set noswapfile

set history=10000

" " omni補完を有効にする
" set omnifunc=syntaxcomplete#Complete
" " omni詳細な補完内容を表示
" set completeopt=menu,preview

""" undoファイルを作成しないようにする (http://www.kaoriya.net/blog/2014/03/30/) {{{
:set noundofile
""" }}}

" let mapleader="\<Space>"
let mapleader="'"

noremap ; :
noremap : ;
noremap <BS> x
""" }}}

""" keybinds {{{
" ノーマルモートでもエンターキーで改行を挿入(http://blog.blueblack.net/item_317)
noremap <CR> o<ESC>

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

" change uppercase / lowercase
" nnoremap <Leader>u gUiw
" nnoremap <Leader>u guiw

nnoremap <Leader><F1> :W3m https://docs.oracle.com/javase/tutorial/reallybigindex.html<CR>
nnoremap <Leader>j5   :W3m https://www.scala-lang.org/<CR>
nnoremap <Leader>j6   :W3m https://debian-handbook.info/browse/stable/<CR>
nnoremap <Leader>j7   :W3m https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.html<CR>
nnoremap <Leader>j8   :W3m https://www.google.com/?hl=en<CR>
nnoremap <Leader>j9   :e ~/src/github.com/cowsys/docs/gnu-c-language-manual.pdf<CR>
nnoremap <Leader>; zb

nnoremap <Leader>2 :e ~/src/github.com/cowsys/docs/tour-of-go-merged-articles<CR>
nnoremap <Leader>3 :e ~/ro-src/go.googlesource.com/go/src<CR>
nnoremap <Leader>4 :e ~/src/github.com/cowsys/docs/go-all-source<CR>
nnoremap <Leader>5 :W3m https://gobyexample.com/<CR>
" nnoremap <Leader>4 :e ~/src/github.com/cowsys/docs/go-all-tests<CR>
nnoremap <Leader>6 :W3m https://golang.org/<CR>

" open doc/tip.md
nnoremap <Leader>7 :e ~/src/github.com/cowsys/docs/<CR>
" open go specification
nnoremap <Leader>8 :W3m https://go.dev/ref/spec<CR>
nnoremap <Leader>9 :e ~/src/github.com/cowsys/docs/Go Programming Language.pdf<CR>

nnoremap <Leader>4 :e ~/src/github.com/cowsys/docs/godoc-output-all<CR>
" add markdown's heading with date
:noremap! <F9> # <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H%M').': '<CR>a

"  easily Up/Down on the Command-Line mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
""" }}}


""" for ctrlp(http://kien.github.com/ctrlp.vim/ {{{
let g:ctrlp_map = '<c-k>'
let g:ctrlp_extensions = ['dir', 'ghq', 'cd']
let g:ctrlp_cmd = 'CtrlPCurWD'

" use ctrlp-matchfuzzy as CtrlP matcher
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

" カレントバッファのルートディレクトリを基準に検索
nnoremap <C-l> :CtrlPRoot<Esc>

" ignore dirs
let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'
""" }}}


""" for fugitive(http://vim-users.jp/2011/06/hack219/) {{{
nnoremap <Space>gd :<C-u>Gvdiff<Enter>
nnoremap <Space>gs :<C-u>Git<Enter>
nnoremap <Space>gl :<C-u>Git log<Enter>
" nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Git commit<Enter>
" nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Git blame<Enter>

" vertical diffをデフォルトで利用する(https://github.com/tpope/vim-fugitive/issues/508)
set diffopt+=vertical
""" }}}

""" for Gitv-diff-folding(http:/cohama.hateblo.jp/entry/20120417/1334679297) {{{
autocmd FileType git :setlocal foldlevel=99
""" }}}


"""for quickrun {{{
" remap Leader&QuickRun
nnoremap <Leader>r :w<CR> :QuickRun<CR>
" let g:quickrun_config = {}
" let g:quickrun_config.go = {
"     \'command': 'go',
" \}
" let g:quickrun_config.vim = {
"     \'command': 'vim',
" \}
""" }}}

""" for vim-easymotion(http://blog.remora.cx/2012/08/vim-easymotion.html {{{
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvb'
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" " use default f/F, t/T with EasyMotion
" nmap f <Plug>(easymotion-f)
" nmap F <Plug>(easymotion-F)
" nmap t <Plug>(easymotion-t)
" nmap T <Plug>(easymotion-T)
""" }}}

""" for japanese input(https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control) {{{
" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
"inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
"""  }}}

""" vim-smartchr(http://d.hatena.ne.jp/ampmmn/20080925/1222338972 {{{
" for right side keys
" inoremap <expr> u smartchr#one_of('u', 'uu', '-', '_')
" inoremap <expr> i smartchr#one_of('i', 'ii', '=', '+')
inoremap <expr> j smartchr#one_of('j', 'jj', '[]')
inoremap <expr> k smartchr#one_of('k', 'kk', '{}')
" inoremap <expr> l smartchr#one_of('l', 'll', '\', '\|')
" inoremap <expr> m smartchr#one_of('m', 'mm', '''', '"')

inoremap <expr> ; smartchr#one_of(';' , '\n', '⛔️ ', ' ✅ ', ' ⚠️ ')

inoremap <expr> , smartchr#one_of(',', '=', ':=')
inoremap <expr> . smartchr#one_of('.', '==', '!=')

" for left side keys
inoremap <expr> f smartchr#one_of('f', 'ff', '`', '~')
""" }}}

""" AndrewRadev/switch.vim {{{

" 以下のswitch_mapping設定はうまく動かないので大本のpluginのnmapを実行
" let g:switch_mapping = "="
nmap = <Plug>(Switch)
let g:switch_custom_definitions =
    \ [
    \   ['⛔️', '✅', '⚠️']
    \ ]
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

""" () {{{
" 1 : QuickFix/ロケーションリストの両方で有効
let QFixWin_EnableMode = 1
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 0
""" }}}

" """ for switch(https://github.com/AndrewRadev/switch.vim) {{{
" let g:switch_mapping = "-"
" """ }}}

""" (previm) {{{
" extension of plantuml file is needed to be *.md
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'

au FileType *.plantuml command! OpenUml :!open -a Google\ Chrome %
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


""" for nvim {{{
if has('nvim')
    set clipboard+=unnamedplus

    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>

    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
""" }}}

""" (https://github.com/img-paste-devs/img-paste.vim) {{{
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" autocmd FileType markdown nmap <buffer><silent> <leader>x :echo g:mapleader
" nnoremap <Leader>r :QuickRun<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
""" }}}

""" (sebdah/vim-delve) {{{
nnoremap <Leader>d :DlvDebug<CR>
nnoremap <Leader>g :DlvTestCurrent<CR>
" nnoremap <Leader>c :DlvClearAll<CR>
nnoremap <Leader>dd :DlvToggleBreakpoint<CR>
nnoremap <Leader>ddd :DlvClearAll<CR>
nnoremap <Leader>T :DlvToggleTracepoint<CR>
""" }}}

""" (buoto/gotests-vim) {{{
nnoremap <Leader>gg :GoTests<CR>
""" }}}
""" (kyoh86/vim-go-coverage) {{{
nnoremap <Leader>c  :GoCover<CR>
nnoremap <Leader>cc :GoCoverClear<CR>
""" }}}

""" (vim-lsp) {{{
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  " nmap <buffer> <f2> <plug>(lsp-rename)

  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  " nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  " nmap <buffer> gp <plug>(lsp-previous-error)
  " nmap <buffer> gn <plug>(lsp-next-error)
  nmap <buffer> <c-j> <plug>(lsp-hover)
  " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/log/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled=0
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

" Option + Enter -> exec :LspCodeAction such as fillstruct
inoremap <Leader>f <Esc>:LspCodeAction<CR>
""" }}}

""" (dense-analysis/ale) {{{
let g:ale_virtualtext_cursor = 'disabled'

" inoremap <Leader>[ <Esc>:ALEPopulateLocList<CR>
" inoremap <Leader>[ <Esc>:ALENextWrap<CR>
" inoremap <Leader>] <Esc>:ALEPreviousWrap<CR>
""" }}}

" """ (thinca/vim-ambicmd) {{{
" cnoremap <expr> <Space> ambicmd#expand("\<Space>")
" """ }}}

""" (vim-vsnip) {{{
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']
""" }}}


""" (itchyny/lightline.vim) {{{
" get rid of messages like "-- INSERT --"
set noshowmode

" show lsp's diagnostics summary(https://kitagry.github.io/blog/programmings/2020/08/lightline-vim-lsp/)
function! LightlineLSPWarnings() abort
  " let l:counts = lsp#ui#vim#diagnostics#get_buffer_diagnostics_counts()
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.warning == 0 ? '' : printf('W:%d', l:counts.warning)
endfunction

function! LightlineLSPErrors() abort
  " let l:counts = lsp#ui#vim#diagnostics#get_buffer_diagnostics_counts()
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.error == 0 ? '' : printf('E:%d', l:counts.error)
endfunction

function! LightlineLSPOk() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  let l:total = l:counts.error + l:counts.warning
  return l:total == 0 ? 'OK' : ''
endfunction

augroup LightLineOnLSP
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'readonly', 'filename', 'modified' ],
  \     [ 'lsp_errors', 'lsp_warnings', 'lsp_ok' ],
  \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype'  ],
  \   ],
  \ },
  \ 'inactive': {
  \   'left': [
  \     [ 'filename' ]
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ]
  \   ],
  \ },
  \ 'tabline': {
  \ 'left': [ [ 'tabs' ] ],
  \ 'right': [ [ 'close' ] ]
  \ },
  \ 'component_expand': {
  \   'lsp_warnings': 'LightlineLSPWarnings',
  \   'lsp_errors':   'LightlineLSPErrors',
  \   'lsp_ok':       'LightlineLSPOk',
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_infos': 'lightline#ale#infos',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'lsp_warnings': 'warning',
  \   'lsp_errors':   'error',
  \   'lsp_ok':       'middle',
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right',
  \ },
  \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'TTT',
    \ },
\ }

""" }}}

" """ from modern vim(terminal/window-switching.vim) {{{
" nnoremap <M-h> <c-w>h
" nnoremap <M-j> <c-w>j
" nnoremap <M-k> <c-w>k
" nnoremap <M-l> <c-w>l
" if has('nvim')
"     tnoremap <M-h> <c-\><c-n><c-w>h
"     tnoremap <M-j> <c-\><c-n><c-w>j
"     tnoremap <M-k> <c-\><c-n><c-w>k
"     tnoremap <M-l> <c-\><c-n><c-w>l
" endif
" """ }}}

""" 行末のスペースを明示的に表示(from vim-technique bible: 1-11) {{{
scriptencoding utf-8
augroup highlightIdeographicSpace
    autocmd!
    autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=Magenta
    autocmd VimEnter,WinEnter * match IdeographicSpace / $/
augroup END
""" }}}

""" kickdict.vim {{{
nnoremap <Leader>ttt <Esc>:KickDict<CR>
" vnoremap <Leader>ttt <Esc>:KickDictVisually<CR>
""" }}}

""" translate.vim {{{
vnoremap <Leader>t <Esc>:Translate<CR>
""" }}}

""" pronunplayer.vim {{{
nnoremap <Leader>ee <Esc>:KickPronunPlayer<CR>
""" }}}

""" british-pronunciations-vim {{{
nnoremap <Leader>e <Esc>:EchoPronuns<CR>
""" }}}

""" maximize window {{{
" # reference document
" :res[ize] [N]
" CTRL-W CTRL-_					*CTRL-W_CTRL-_* *CTRL-W__*
" CTRL-W _	Set current window height to N (default: highest possible).

" nnoremap <Leader>ee <Esc>:res 100<CR>
""" }}}


""" open selected URL by W3m(depends on mattn/vim-textobj-url) {{{
function! Open_selected_url_by_w3m() abort
    normal! gv""y
    let url = @"
    execute "sp"
    let run_command = 'term w3m "' . url . '"'
    execute run_command
endfunction

vnoremap <Leader>ww <Esc>:call Open_selected_url_by_w3m()<CR>
""" }}}


""" surround with ``` {{{
autocmd FileType * let b:surround_96 = "```\n\r\n```"
autocmd FileType make let b:surround_96 = "```\n\r\n```"
""" }}}


""" mattn/vim-goimports {{{
let g:goimports_show_loclist = 0
""" }}}


""" yoshida-m-3/vim-im-select {{{
let g:im_select_default = 'com.google.inputmethod.Japanese.Roman'
let g:im_select_enable_focus_events = 0
""" }}}


""" https://github.com/rhysd/vim-clang-format {{{
autocmd FileType c ClangFormatAutoEnable
""" }}}

""" scroll-cursor関係のkeyを覚えやすいように追加でmap定義 {{{
nmap z, z<Enter> 
"    z. の入力は覚えやすいので追加定義しない
nmap z/ z-
""" }}}

""" (template) {{{
""" }}}
