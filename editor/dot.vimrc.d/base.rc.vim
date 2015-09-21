set hidden

set nrformats=

set scrolloff=5

set noerrorbells

set visualbell t_vb=

set display=lastline

set virtualedit=block

set clipboard+=unnamed

set whichwrap=b,s ",[,],<,>

set backspace=indent,eol,start

set viminfo='50,\"1000,n~/.vim/var/tmp/.viminfo

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
