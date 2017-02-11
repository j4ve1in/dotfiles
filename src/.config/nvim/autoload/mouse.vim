function! mouse#mode(mode) abort
  if a:mode ==# 'on'
    set mouse=a
    echo 'Mouse: ON'
  elseif a:mode ==# 'off'
    set mouse=
    echo 'Mouse: OFF'
  endif
endfunction
