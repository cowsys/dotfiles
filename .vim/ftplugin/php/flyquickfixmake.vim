setlocal makeprg=$HOME/bin/vimparse.php % $*
setlocal errorformat=%f:%l:%m
setlocal shellpipe=2>&1 >
au BufWritePost * silent make
