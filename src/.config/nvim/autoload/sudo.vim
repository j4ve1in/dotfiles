function! sudo#write() abort
  write !sudo tee >/dev/null %
  edit!
endfunction
