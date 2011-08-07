""" 基本表示設定
" カーソルポジションを表示
set ruler


""" タブ設定
" タブ入力をスペースに展開
set expandtab
" タブ入力のスペース展開時、何文字に展開するか設定
set tabstop=4
" タブ入力時xスペース入力に設定
set softtabstop=4
" 自動挿入するスペース文字数を設定
set shiftwidth=4


""" ファイル関連設定
" スワップファイル(.swp)を作成しない
set noswapfile
" バックアップファイル(hoge~)を作成しない
set nobackup


""" 独自設定
" F5で日時入力
:noremap! <F5> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M:%S')<CR>a
" pcコピーバッファと共有
:set clipboard=unnamed


""" 検索設定
set smartindent
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索で色をつける
set hlsearch


"表示行単位で行移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
