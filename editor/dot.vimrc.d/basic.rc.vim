set backspace=indent,eol,start

set hidden

set nrformats=

"set clipboard+=unnamed
set clipboard=unnamedplus,autoselect

set virtualedit=block

set noerrorbells

set novisualbell

" set whichwrap=b,s,[,],<,>

au BufRead,BufNewFile *.vim set foldmethod=marker

set encoding=utf-8

set fileformats=unix,dos,mac

scriptencoding utf-8

set termencoding=utf-8

if exists('&ambiwidth')
  set ambiwidth=double
endif

" swapfile
set swapfile
set directory=~/.vim/tmp/swap


" backupfile
set backup
set backupdir=~/.vim/var/tmp/backup


" undofile
set undofile
set undodir=~/.vim/var/tmp/undo


" viminfo
set viminfo+=n~/.vim/var/tmp/.viminfo


" mouse
set mouse=a

set ttymouse=xterm2
