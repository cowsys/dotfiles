set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
runtime! user/*.vim
