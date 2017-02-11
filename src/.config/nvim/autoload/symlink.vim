function! symlink#follow() abort
  let l:buf = bufnr('%')
  let l:file = resolve(expand('%:p'))
  let l:pos = getpos('.')

  enew
  exec 'bwipeout ' . l:buf
  exec 'edit ' . l:file
  call setpos('.', l:pos)
  edit!
endfunction
