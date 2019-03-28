set termguicolors
highlight clear
set background=light

function! s:hi(name, fg, bg, attr) abort
  let l:attr = type(a:attr) != type(0) ? ('gui=' . a:attr) : ''
  let l:fg   = type(a:fg) != type(0) ? ('guifg=' . a:fg) : ''
  let l:bg   = type(a:bg) != type(0) ? ('guibg=' . a:bg) : ''

  execute 'highlight' a:name l:attr l:fg l:bg
endfunction

let s:fg  = '#DDDDDD'
let s:bg  = '#000000'

let s:red = '#C40000'

let s:lightgreen = '#00FFFF'
let s:green      = '#00FF00'

let s:lightblue = '#5FAFFF'
let s:blue      = '#0000C8'
let s:darkblue  = '#00014E'

let s:cyan     = '#00AFFF'
let s:darkcyan = '#005FFF'

let s:lightpurple = '#5F87FF'
let s:purple      = '#875FFF'

let s:lightgray  = '#4C4C4C'
let s:gray       = '#808080'
let s:darkgray   = '#303030'

call s:hi('Comment',                 s:gray,        0,          0)
call s:hi('Boolean',                 s:darkcyan,    0,          0)
call s:hi('LineNr',                  s:lightgray,   0,          0)
call s:hi('Constant',                s:cyan,        0,          0)
call s:hi('Statement',               s:lightblue,   0,          'bold')
call s:hi('PreProc',                 s:lightpurple, 0,          0)
call s:hi('Type',                    s:lightblue,   0,          0)
call s:hi('Cursor',                  0,             s:darkblue, 0)
call s:hi('CursorLine',              0,             s:darkblue,     0)
call s:hi('CursorLineNr',            s:darkcyan,    s:bg,       'bold')
call s:hi('CursorColumn',            0,             s:bg,       0)
call s:hi('DiffAdd',                 s:green,       'NONE',     0)
call s:hi('DiffChange',              s:fg,          'NONE',     0)
call s:hi('DiffDelete',              s:bg,          s:bg,       0)
call s:hi('DiffText',                s:red,         'NONE',     0)
call s:hi('DiffNewFile',             s:lightblue,   'NONE',     0)
call s:hi('DiffFile',                s:lightblue,   'NONE',     0)
call s:hi('diffAdded',               s:green,       'NONE',     0)
call s:hi('diffChanged',             s:fg,          'NONE',     0)
call s:hi('diffRemoved',             s:red,         'NONE',     0)
call s:hi('FoldColumn',              s:darkcyan,    0,          0)
call s:hi('Folded',                  s:darkcyan,    s:darkgray, 0)
call s:hi('Directory',               s:darkcyan,    0,          0)
call s:hi('ErrorMsg',                s:red,         'NONE',     0)
call s:hi('Function',                s:darkcyan,    0,          0)
call s:hi('Identifier',              s:lightgreen,  0,          0)
call s:hi('IncSearch',               s:darkcyan,    0,          0)
call s:hi('ModeMsg',                 s:darkcyan,    0,          0)
call s:hi('MoreMsg',                 s:darkcyan,    0,          0)
call s:hi('NonText',                 s:gray,        'NONE',     0)
call s:hi('Normal',                  s:fg,          0,          0)
call s:hi('Operator',                s:gray,        'NONE',     0)
call s:hi('Pmenu',                   s:fg,          s:bg,       0)
call s:hi('PmenuSel',                s:fg,          s:darkblue, 0)
call s:hi('PmenuSbar',               s:fg,          s:darkblue, 0)
call s:hi('Question',                s:darkcyan,    0,          0)
call s:hi('Search',                  s:fg,          s:darkcyan, 0)
call s:hi('SignColumn',              s:fg,          'NONE',     0)
call s:hi('Special',                 s:fg,          'NONE',     0)
call s:hi('SpecialKey',              s:gray,        'NONE',     0)
call s:hi('SpellBad',                s:red,         'NONE',     0)
call s:hi('StatusLine',              s:bg,          s:gray,     0)
call s:hi('StatusLineNC',            s:bg,          s:gray,     0)
call s:hi('String',                  s:cyan,        0,          0)
call s:hi('TabLine',                 s:fg,          s:gray,     0)
call s:hi('TabLineFill',             s:gray,        'NONE',     'underline')
call s:hi('TabLineSel',              s:fg,          s:darkblue, 0)
call s:hi('Title',                   s:darkcyan,    0,          0)
call s:hi('Todo',                    s:red,         'NONE',     0)
call s:hi('VertSplit',               s:fg,          'NONE',     0)
call s:hi('Visual',                  s:fg,          s:darkcyan, 0)
call s:hi('WarningMsg',              s:bg,          s:gray,     0)
call s:hi('WildMenu',                s:fg,          s:bg,       'bold')
call s:hi('EndOfBuffer',             s:bg,          'NONE',     0)
call s:hi('DoubleByteSpace',         s:darkcyan,    0,          'reverse')

" Hilighting double-byte space
augroup doublebyte_space
  autocmd!
  autocmd VimEnter,WinEnter * match DoubleByteSpace /　/
augroup END

augroup toggle_match_paren
  autocmd!
  autocmd InsertEnter * call s:hi('MatchParen', 0, 'NONE', 0)
  autocmd InsertLeave * call s:hi('MatchParen', s:darkcyan, 0, 0)
augroup END

call s:hi('ALEErrorSign',   s:red, 0, 0)
call s:hi('ALEWarningSign', s:red, 0, 0)
