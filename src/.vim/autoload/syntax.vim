command! SyntaxInfo call syntax#info()

function! syntax#info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
    \ " ctermfg: " . baseSyn.ctermfg .
    \ " ctermbg: " . baseSyn.ctermbg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
    \ " ctermfg: " . linkedSyn.ctermfg .
    \ " ctermbg: " . linkedSyn.ctermbg
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
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  return {
  \   "name": name,
  \   "ctermfg": ctermfg,
  \   "ctermbg": ctermbg
  \ }
endfunction
