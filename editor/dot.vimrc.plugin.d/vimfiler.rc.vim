let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
autocmd FileType vimfiler 
  \ nnoremap <buffer><silent>/ 
  \ :<C-u>Unite file -default-action=vimfiler<CR>
autocmd FileType vimfiler setlocal statusline=VimFiler
