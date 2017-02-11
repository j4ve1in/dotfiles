function! append#line(target) abort
  for l:i in range(v:count1)
    if a:target ==# 'up'
      call append(line('.'), '')
    elseif a:target ==# 'down'
      call append(line('.') - 1, '')
    endif
  endfor
endfunction
