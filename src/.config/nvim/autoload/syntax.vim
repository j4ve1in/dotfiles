function! syntax#info() abort
  let l:baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo 'name: ' . l:baseSyn.name .
    \ ' guifg: ' . l:baseSyn.guifg .
    \ ' guibg: ' . l:baseSyn.guibg
  let l:linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo 'link to'
  echo 'name: ' . l:linkedSyn.name .
    \ ' guifg: ' . l:linkedSyn.guifg .
    \ ' guibg: ' . l:linkedSyn.guibg
endfunction

function! s:get_syn_id(transparent) abort
  let l:synid = synID(line('.'), col('.'), 1)
  if a:transparent
    return synIDtrans(l:synid)
  else
    return l:synid
  endif
endfunction

function! s:get_syn_attr(synid) abort
  let l:name = synIDattr(a:synid, 'name')
  let l:guifg = synIDattr(a:synid, 'fg', 'gui')
  let l:guibg = synIDattr(a:synid, 'bg', 'gui')
  return {
  \   'name': l:name,
  \   'guifg': l:guifg,
  \   'guibg': l:guibg
  \ }
endfunction
