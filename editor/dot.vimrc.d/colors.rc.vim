" Colorscheme " {{{
"--------------------------------------------------------------------
" Description: Vim colorscheme, designed against VIM 7.4
" Credits: Inspiration from the dw_blue scheme.
"--------------------------------------------------------------------

set t_Co=256 " Enable 256 colors.
set t_ut=
syntax enable " Switch on syntax highlighting
set cursorline "Highlight the screen line of the cursor with CursorLine.
augroup vimrc_change_cursorline_color
  autocmd!
  " Set CursorLine highlighting.
  autocmd InsertEnter * highlight CursorLine cterm=none ctermbg=17
  " Reset CursorLine highlighting to the defaults.
  autocmd VimEnter,InsertLeave * highlight clear CursorLine
augroup END

"--------------------------------------------------------------------
hi Boolean                                       ctermfg=27
hi cDefine                                       ctermfg=231
hi cInclude                                      ctermfg=231
hi Comment                                       ctermfg=245
hi Constant                                      ctermfg=99
hi Cursor                           ctermbg=240  ctermfg=231
hi CursorLineNr    cterm=bold       ctermbg=0    ctermfg=none
hi CursorColumn                     ctermbg=0
hi DiffAdd                          ctermbg=248  ctermfg=27
hi DiffChange                       ctermbg=248  ctermfg=27
hi DiffDelete                       ctermbg=248  ctermfg=27
hi DiffText                         ctermbg=248  ctermfg=231
hi Directory                        ctermbg=232  ctermfg=27
hi ErrorMsg                         ctermbg=231  ctermfg=232
hi FoldColumn                       ctermbg=236  ctermfg=196
hi Folded                           ctermbg=236  ctermfg=196
hi Function                         ctermbg=232  ctermfg=27
hi Identifier                       ctermbg=232  ctermfg=51
hi IncSearch       cterm=none       ctermbg=20   ctermfg=232
hi LineNr                           ctermbg=232  ctermfg=27
hi MatchParen      cterm=none       ctermbg=236  ctermfg=27
hi ModeMsg                          ctermbg=232  ctermfg=27
hi MoreMsg                          ctermbg=232  ctermfg=27
hi NonText                          ctermbg=232  ctermfg=239
hi Normal          cterm=none       ctermbg=232  ctermfg=251
hi Operator        cterm=none                    ctermfg=239
hi Pmenu                            ctermbg=233  ctermfg=255
hi PmenuSel                         ctermbg=17   ctermfg=255
hi PmenuSbar                        ctermbg=233  ctermfg=255
hi PreProc         cterm=none                    ctermfg=231
hi Question                                      ctermfg=27
hi Search          cterm=none       ctermbg=21   ctermfg=15
hi SignColumn                       ctermbg=8    ctermfg=231
hi Special         cterm=none       ctermbg=232  ctermfg=231
hi SpecialKey                       ctermbg=232  ctermfg=27
hi SpellBad                         ctermbg=26   ctermfg=232
hi Statement       cterm=bold                    ctermfg=75
hi StatusLine      cterm=bold       ctermbg=17   ctermfg=231
hi StatusLineNC    cterm=none       ctermbg=240  ctermfg=232
hi String          cterm=none                    ctermfg=39
hi TabLine         cterm=none       ctermbg=240  ctermfg=231
hi TabLineFill     cterm=underline  ctermbg=232  ctermfg=240
hi TabLineSel      cterm=none       ctermbg=19   ctermfg=231
hi Title           cterm=none                    ctermfg=27
hi Todo            cterm=none       ctermbg=232  ctermfg=196
hi Type            cterm=none                    ctermfg=231
hi VertSplit       cterm=none       ctermbg=232  ctermfg=231
hi Visual                           ctermbg=26   ctermfg=232
hi WarningMsg                       ctermbg=244  ctermfg=232
hi WildMenu                         ctermbg=231  ctermfg=17

"- end of colorscheme -----------------------------------------------
" }}}

" Syntaxinfo
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
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
  \   "name": name,
  \   "ctermfg": ctermfg,
  \   "ctermbg": ctermbg,
  \   "guifg": guifg,
  \   "guibg": guibg
  \ }
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
    \ " ctermfg: " . baseSyn.ctermfg .
    \ " ctermbg: " . baseSyn.ctermbg .
    \ " guifg: " . baseSyn.guifg .
    \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
    \ " ctermfg: " . linkedSyn.ctermfg .
    \ " ctermbg: " . linkedSyn.ctermbg .
    \ " guifg: " . linkedSyn.guifg .
    \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
