function! source#init() abort
  source $MYVIMRC
  echo 'Source ' . fnamemodify($MYVIMRC, ':t')
endfunction

function! source#rc(path) abort
  if filereadable(expand('~/.config/nvim/rc/' . a:path . '.vim'))
    execute 'source' fnameescape(expand('~/.config/nvim/rc/' . a:path . '.vim'))
  endif
endfunction
