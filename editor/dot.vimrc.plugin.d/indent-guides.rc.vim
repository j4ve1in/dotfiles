let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=247
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim', 'man', 'vimfiler']
