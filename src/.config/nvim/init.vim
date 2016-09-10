filetype off
filetype plugin indent off

" Cache
let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" Declare rc_vim_list and source_rc
let rc_vim_list = [
\   'local.before',
\   'plugins',
\   'apperance',
\   'base',
\   'colors',
\   'keymap',
\   'local'
\ ]

function! s:source_rc(path)
  if filereadable(expand('~/.config/nvim/rc/' . a:path . '.vim'))
    execute 'source' fnameescape(expand('~/.config/nvim/rc/' . a:path . '.vim'))
  endif
endfunction

" Source settings
" Location: ~/.config/nvim/rc/
for rc_vim in rc_vim_list
  cal s:source_rc(rc_vim)
endfor

filetype plugin indent on
