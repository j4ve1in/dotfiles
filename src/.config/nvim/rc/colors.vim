"--------------------------------------------------------------------
" Description: Vim colorscheme, designed against VIM 7.4
" Credits: Inspiration from the dw_blue scheme.
"--------------------------------------------------------------------

set background=light
syntax enable " Switch on syntax highlighting
augroup change_cursorline_color
  autocmd!
  " Set CursorLine highlighting.
  autocmd InsertEnter * set cursorline | highlight CursorLine cterm=none ctermbg=17
  " Reset CursorLine highlighting to the defaults.
  autocmd InsertLeave * set nocursorline | highlight clear CursorLine
augroup END

"--------------------------------------------------------------------
hi Boolean                                     ctermfg=27
hi cDefine                                     ctermfg=69
hi cInclude                                    ctermfg=31
hi Comment                                     ctermfg=245
hi Constant                                    ctermfg=99
hi Cursor                         ctermbg=17
hi CursorLine     cterm=none      ctermbg=17
hi CursorLineNr   cterm=bold      ctermbg=0    ctermfg=none
hi CursorColumn                   ctermbg=0
hi DiffAdded                      ctermbg=none ctermfg=46
hi DiffChange                     ctermbg=none ctermfg=255
hi DiffDelete                     ctermbg=232  ctermfg=232
hi DiffText                       ctermbg=none ctermfg=160
hi DiffNewFile                    ctermbg=none ctermfg=75
hi DiffFile                       ctermbg=none ctermfg=75
hi DiffRemoved                    ctermbg=none ctermfg=160
hi Directory                      ctermbg=none ctermfg=27
hi ErrorMsg                       ctermbg=231  ctermfg=232
hi FoldColumn                     ctermbg=none ctermfg=27
hi Folded                         ctermbg=236  ctermfg=27
hi Function                       ctermbg=none ctermfg=27
hi Identifier                     ctermbg=none ctermfg=51
hi IncSearch      cterm=none      ctermbg=20   ctermfg=232
hi LineNr                         ctermbg=none ctermfg=27
hi MatchParen     cterm=none      ctermbg=none ctermfg=27
hi ModeMsg                        ctermbg=none ctermfg=27
hi MoreMsg                        ctermbg=none ctermfg=27
hi NonText                        ctermbg=none ctermfg=239
hi Normal         cterm=none      ctermbg=none ctermfg=251
hi Operator       cterm=none                   ctermfg=239
hi Pmenu                          ctermbg=232  ctermfg=255
hi PmenuSel                       ctermbg=17   ctermfg=255
hi PmenuSbar                      ctermbg=17   ctermfg=255
hi PreProc        cterm=none                   ctermfg=69
hi Question                                    ctermfg=27
hi Search         cterm=none      ctermbg=27   ctermfg=15
hi SignColumn                     ctermbg=none ctermfg=231
hi Special        cterm=none      ctermbg=none ctermfg=231
hi SpecialKey                     ctermbg=none ctermfg=245
hi SpellBad                       ctermbg=none ctermfg=196
hi Statement      cterm=bold                   ctermfg=75
hi StatusLine     cterm=bold      ctermbg=17   ctermfg=231
hi StatusLineNC   cterm=none      ctermbg=240  ctermfg=232
hi String         cterm=none                   ctermfg=39
hi TabLine        cterm=none      ctermbg=240  ctermfg=231
hi TabLineFill    cterm=underline ctermbg=none ctermfg=240
hi TabLineSel     cterm=none      ctermbg=19   ctermfg=231
hi Title          cterm=none                   ctermfg=27
hi Todo           cterm=none      ctermbg=none ctermfg=196
hi Type           cterm=none                   ctermfg=75
hi VertSplit      cterm=none      ctermbg=none ctermfg=231
hi Visual                         ctermbg=26   ctermfg=231
hi WarningMsg                     ctermbg=244  ctermfg=232
hi WildMenu                       ctermbg=231  ctermfg=17
hi rubyBlock                      ctermbg=none ctermfg=161
hi zshVariableDef                 ctermbg=none ctermfg=39
hi zshFunction                    ctermbg=none ctermfg=44
hi EndOfBuffer        cterm=none  ctermbg=none ctermfg=0
