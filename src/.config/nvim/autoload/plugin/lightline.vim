function! plugin#lightline#syntaxcheck() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  let l:errors = ''
  if l:all_errors > 0
    let l:errors = l:errors . "E:". l:all_errors
  endif
  if l:all_non_errors > 0
    let l:errors = l:errors . " W:" . l:all_non_errors
  endif

  return l:errors
endfunction
