function! buf#byte() abort
  return line2byte(line('$') + 1) == -1 ? 0 : -1
endfunction
