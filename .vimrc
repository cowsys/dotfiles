" input date
:noremap! <F5> <ESC>:execute 'normal a'.strftime('%Y/%m/%d %H:%M:%S')<CR>a

" share copy buffer
:set clipboard=unnamed
