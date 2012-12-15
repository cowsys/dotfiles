""" vundle
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" original repos on github
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'gregsexton/gitv'
Bundle 'h1mesuke/vim-alignta'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'JavaScript-syntax'
Bundle 'kana/vim-smartchr'
Bundle 'kana/vim-operator-user'
Bundle 'kana/vim-operator-replace'
Bundle 'fuenor/qfixgrep'
Bundle 'kana/vim-smartinput'
Bundle 'thinca/vim-ref'

" vim-scripts repos
"Bundle 'errormarker.vim'
Bundle 'confluencewiki.vim'
Bundle 'ack.vim'

" etc
Bundle 'bufexplorer.zip'


filetype plugin indent on

syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nobackup
set noswapfile

" 常に行数を表示する
set nu

" input date
:noremap! <F1> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M')<CR>a
:noremap! <F2> <ESC>:execute 'normal a'.strftime('%H:%M')<CR>a

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


" 文字コードの自動認識(http://www.kawaz.jp/pukiwiki/?vim
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" ステータスラインに文字コードと改行コードを表示(http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese#TOC-7
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

" highright search
set hlsearch

"""" php構文チェック(http://d.hatena.ne.jp/i_ogi/20070321/1174495931
""":set makeprg=php\ -l\ %
""":set errorformat=%m\ in\ %f\ on\ line\ %l"
"""
" quickrunでphpunitを実行する(http://d.hatena.ne.jp/ruedap/20110225/vim_php_phpunit_quickrun
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.unit
augroup END

"" 初期化
let g:quickrun_config = {}
"" PHPUnit
"let g:quickrun_config['php.unit'] = {'command': 'phpunit'}

" barの色づけ(http://d.hatena.ne.jp/uk_oasis/20110928/1317217247
" make outputter for coloring output message.
let phpunit_outputter = quickrun#outputter#buffer#new()
function! phpunit_outputter.init(session)
  " call original process
  call call(quickrun#outputter#buffer#new().init, [a:session], self)
endfunction

function! phpunit_outputter.finish(session)
  " set color
  highlight default PhpUnitOK         ctermbg=Green ctermfg=White
  highlight default PhpUnitFail       ctermbg=Red   ctermfg=White
  highlight default PhpUnitAssertFail ctermfg=Red
  call matchadd("PhpUnitFail","^FAILURES.*$")
  call matchadd("PhpUnitOK","^OK.*$")
  call matchadd("PhpUnitAssertFail","^Failed.*$")
  call call(quickrun#outputter#buffer#new().finish, [a:session], self)
endfunction

" regist outputter to quickrun
call quickrun#register_outputter("phpunit_outputter", phpunit_outputter)

" PHPUNIT
let g:quickrun_config['php.unit'] = {
   \'command': 'phpunit',
   \'outputter': 'phpunit_outputter',
   \}

" for Fugitive(http://vim-users.jp/2011/06/hack219/) {{{
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
" }}}


" for gitv(http://d.hatena.ne.jp/cohama/20120417/1334679297 {{{
autocmd FileType git :setlocal foldlevel=99
" }}}
"
" for syntastic {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
" }}}
"
" ウィンドウ移動用キーバインド(http://yuroyoro.hatenablog.com/entry/20120211/1328930819, https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.moving {{{
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" }}}
"
"
" for vim-easymotion(http://blog.remora.cx/2012/08/vim-easymotion.html {{{
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}
"
"
"" gnu global
map <C-g> :Gtags
map <C-i> :Gtags -f %<CR>
map <C-j><C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>


"" for vim-smartchr(http://d.hatena.ne.jp/ampmmn/20080925/1222338972 {{{
inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ')
inoremap <expr> , smartchr#one_of(', ', ',')
inoremap <expr> + smartchr#one_of(' + ', '++', '+')
inoremap <expr> - smartchr#one_of(' - ', '--', '-')
inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
inoremap <expr> . smartchr#one_of('.', '->')
"inoremap <expr> { smartchr#one_of(' {', ' {<cr>')
"inoremap <expr> } smartchr#one_of(' }', ' }<cr>')
inoremap <expr> ; smartchr#one_of(';', ';<cr>')
inoremap <expr> i smartchr#one_of('i', 'ii', '{info}')
inoremap <expr> c smartchr#one_of('c', 'cc', '{code}')
" }}}
"
"
"" ウィンドウに余裕を持たせてスクロールする(http://d.hatena.ne.jp/vimtaku/20121117/1353138802# {{{
""set scrolloff=10
"" }}}

"" qでウインドウを閉じてQでマクロ(http://d.hatena.ne.jp/vimtaku/20121117/1353138802# {{{
nnoremap q :<C-u>q<CR>
nnoremap Q q
"" }}}

"" for operator replace(https://github.com/kana/vim-operator-replace/blob/master/doc/operator-replace.txt {{{
" _wなどでYankしてるもので置き換える
nmap _ <Plug>(operator-replace)
"" }}}


" for ctrlp(ref:http://kien.github.com/ctrlp.vim/
let g:ctrlp_map = '<c-k>'

" for qfixgrep(
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]svn[/\\][/\\]git[/\\]'

" for vim-ref php documents
let g:ref_phpmanual_path = '~/.vim/langdoc/php'

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>
