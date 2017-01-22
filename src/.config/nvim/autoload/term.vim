function! term#run(cmd) abort
  let l:path = expand('%:p')
  vertical rightbelow new
  call termopen(a:cmd . ' ' . l:path)
  wincmd p
endfunction
