let s:white  = [ '#DDDDDD', 255 ]
let s:black  = [ '#000000', 0 ]
let s:red  = [ '#FE0000', 196 ]
let s:cyan  = [ '#00AFFF', 39 ]
let s:darkpurple  = [ '#5F0087', 54 ]

let s:blue  = [ '#0000C8', 21 ]
let s:darkblue  = [ '#00014E', 17 ]

let s:gray  = [ '#808080', 235 ]
let s:lightgray  = [ '#4C4C4C', 240 ]

let s:none  = [ 'NONE', 'NONE' ]

let s:p = {
\   'normal':   {},
\   'inactive': {},
\   'insert':   {},
\   'replace':  {},
\   'visual':   {},
\   'tabline':  {}
\ }

let s:p.normal.middle = [[s:white, s:black]]
let s:p.normal.left = [[s:white, s:darkblue], [s:white, s:blue]]
let s:p.normal.right = [[s:white, s:darkblue], [s:white, s:blue]]

let s:p.normal.error = [[ s:red, s:black ]]

let s:p.inactive.middle = [[s:white, s:black]]
let s:p.inactive.right = [[s:white, s:gray], [s:white, s:lightgray]]
let s:p.inactive.left = [[s:white, s:gray]]

let s:p.insert.left = [[s:darkblue, s:white], s:p.normal.left[1]]
let s:p.replace.left = [[s:white, s:cyan], s:p.normal.left[1]]
let s:p.visual.left = [[s:white, s:darkpurple], s:p.normal.left[1]]

let s:p.tabline.middle = [[s:white, s:none]]
let s:p.tabline.right = [[s:white, s:darkblue], [s:darkblue, s:none]]
let s:p.tabline.left = [[s:white, s:black]]
let s:p.tabline.tabsel = [[s:white, s:darkblue]]
let g:lightline#colorscheme#abyss#palette = lightline#colorscheme#flatten(s:p)

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

function! plugin#lightline#filename() abort
  if '' ==# expand('%:t')
    return '[N]' " No Name
  elseif &filetype ==# 'fzf'
    return '[P]' " Plugin
  else
    return expand('%:t')
  endif
endfunction
