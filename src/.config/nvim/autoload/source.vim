function! source#rc(path) abort
  if filereadable(expand('~/.config/nvim/rc/' . a:path . '.vim'))
    execute 'source' fnameescape(expand('~/.config/nvim/rc/' . a:path . '.vim'))
  endif
endfunction
