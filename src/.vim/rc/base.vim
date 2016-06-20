set hidden
set ttyfast
set autoread
set history=50
set nrformats=
set scrolloff=5
set winheight=8
set noequalalways
set display=lastline
set virtualedit=block
set clipboard+=unnamed
set grepprg=grep\ -inH
set whichwrap=b,~,[,],<,>
set backspace=indent,eol,start
set noerrorbells visualbell t_vb=
autocmd QuickFixCmdPost *grep* cwindow
set viminfo='30,<50,s100,n~/.vim/viminfo

if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

if has('conceal')
  set conceallevel=0 concealcursor=
endif

" Completion
set wildmenu wildmode=list,full

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
  autocmd FileType go setlocal noexpandtab
  autocmd FileType php setlocal noexpandtab
  autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Markup Language
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType slim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType pug setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Style Sheet
  autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Shell Script
  autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Data Format
  autocmd FileType toml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Others
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType man setlocal tabstop=8
augroup END

"" Others
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType man setlocal nospell nolist readonly nomodified nomodifiable
