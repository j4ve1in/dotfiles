let g:indent_guides_auto_colors=0 " 自動カラーを無効にする
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=247 " 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239 " 偶数番目のインデントの色
let g:indent_guides_enable_on_vim_startup=1 " Vimを起動したとき、自動的にvim-indent-guidesをオンにする
let g:indent_guides_color_change_percent=30 " ハイライト色の変化の幅
let g:indent_guides_guide_size=1 " ガイドの幅
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']
