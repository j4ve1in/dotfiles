function! syntax#info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
    \ " guifg: " . baseSyn.guifg .
    \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
    \ " guifg: " . linkedSyn.guifg .
    \ " guibg: " . linkedSyn.guibg
endfunction

function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction

function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
  \   "name": name,
  \   "guifg": guifg,
  \   "guibg": guibg
  \ }
endfunction
