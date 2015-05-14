set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" set autoindent " 改行時に前の行のインデントを継続する

" 改行時にコメントを継続させない
autocmd FileType *  setlocal formatoptions-=ro
