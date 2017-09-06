function! im#fcitx() abort
  if system("fcitx-remote") == 2
    call system("fcitx-remote -c")
  endif
endfunction
