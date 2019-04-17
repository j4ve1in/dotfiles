function! source#rc(path) abort
  if filereadable(expand($XDG_CONFIG_HOME . '/nvim/rc/' . a:path . '.vim'))
    execute 'source' fnameescape(expand($XDG_CONFIG_HOME . '/nvim/rc/' . a:path . '.vim'))
  endif
endfunction
