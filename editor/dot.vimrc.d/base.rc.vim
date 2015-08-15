set backspace=indent,eol,start

set hidden

set nrformats=

set clipboard+=unnamed

set virtualedit=block

set noerrorbells

set novisualbell

set whichwrap=b,s ",[,],<,>

au BufRead,BufNewFile *.vim set foldmethod=marker

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

" .vimrc
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
