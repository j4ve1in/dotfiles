set backspace=indent,eol,start

set hidden

set nrformats=

set clipboard+=unnamed

set virtualedit=block

set noerrorbells

set novisualbell

set display=lastline

set viminfo+=n~/.vim/var/tmp/.viminfo

set whichwrap=b,s ",[,],<,>

autocmd FileType *  setlocal formatoptions-=ro

autocmd FileType man setlocal nospell ts=8 nolist ro nomod noma

if exists('&ambiwidth')
  set ambiwidth=double
endif

if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" Completion
set wildmenu
set wildmode=list:full

" Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Search
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

" Swapfile
set swapfile
set directory=~/.vim/tmp/swap

" Backupfile
set backup
set backupdir=~/.vim/var/tmp/backup

" Undofile
set undofile
set undodir=~/.vim/var/tmp/undo

" Mouse
set mouse=a
set ttymouse=xterm2

" .vimrc
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
