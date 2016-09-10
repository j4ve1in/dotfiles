set hidden
set undofile
set scrolloff=5
set winheight=8
set virtualedit=block
set grepprg=grep\ -inH
set whichwrap=b,~,[,],<,>
autocmd QuickFixCmdPost *grep* cwindow

" clipboard
let OSTYPE = substitute(system('uname'), '\n', '', '')
set clipboard&
if OSTYPE == 'Linux'
  set clipboard^=unnamedplus
elseif OSTYPE == 'MSYS_NT-10.0'
  set clipboard^=unnamed
endif

" Completion
set wildignorecase wildmode=longest:full,full

" Search
set ignorecase smartcase

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
