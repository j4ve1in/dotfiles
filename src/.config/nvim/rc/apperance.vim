set ruler
set number
set showmatch
set noshowmode
set matchtime=1
set showtabline=2
let &showbreak="\u21aa "
set list
set listchars=tab:▸\ ,trail:˽,eol:¬,extends:>,precedes:<,nbsp:%

augroup nohlsearch
  autocmd!
  autocmd InsertEnter * let b:_search=@/|let @/=''
  autocmd InsertLeave * let @/=get(b:,'_search','')
augroup END

" colorscheme
set cursorline

" Hilighting double-byte space
augroup doublebyte_space
  autocmd!
  autocmd VimEnter,WinEnter * match DoubleByteSpace /　/
augroup END

colorscheme abyss
