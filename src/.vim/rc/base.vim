set hidden
set ttyfast
set autoread
set history=50
set nrformats=
set scrolloff=5
set display=lastline
set virtualedit=block
set clipboard+=unnamed
set whichwrap=b,~,[,],<,>
set backspace=indent,eol,start
set noerrorbells visualbell t_vb=
set viminfo='30,<50,s100,n~/.vim/viminfo

if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

if has('conceal')
  set conceallevel=0 concealcursor=
endif

" Completion
set wildmenu wildmode=list:full

" Search
set wrapscan ignorecase smartcase incsearch hlsearch

" Swapfile
set swapfile directory=~/.vim/swap

" Backupfile
set backup backupdir=~/.vim/backup

" Undofile
set undofile undodir=~/.vim/undo

" Mouse
set mouse=a ttymouse=xterm2

" File
"" Indent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab
  autocmd BufNewFile,BufRead *.php setlocal noexpandtab
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Markup Language
  autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.slim setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Style Sheet
  autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Shell Script
  autocmd BufNewFile,BufRead *.sh setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.bash setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Data Format
  autocmd BufNewFile,BufRead *.toml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Others
  autocmd BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.man setlocal tabstop=8
augroup END

"" Others
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType man setlocal nospell nolist readonly nomodified nomodifiable nolist
