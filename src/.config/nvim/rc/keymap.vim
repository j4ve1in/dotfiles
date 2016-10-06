" emacs like
inoremap <C-j> <CR><TAB>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <C-d> <DEL>
cnoremap <C-a> <C-b>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <DEL>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" clipboard
nnoremap Y y$
nnoremap s "_s

" Substitute
nnoremap gs :<C-u>%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>

" Search
" Current line at center of window and open the folding.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" TextObject
onoremap aa a>
onoremap ia i>
onoremap ar a]
onoremap ir i]
onoremap ad a"
onoremap id i"

" C-Space
if has('unix')
  map <NUL> <C-Space>
  map! <NUL> <C-Space>
endif

" Others
nnoremap gm :<C-u>set mouse=a ttymouse=xterm2 \| echo 'Mouse: ON'<CR>
nnoremap gM :<C-u>set mouse= \| echo 'Mouse: OFF'<CR>
nnoremap <C-g> 1<C-g>
vnoremap v $h
noremap gvv 0v$h
nnoremap <C-e> :<C-u>edit!<CR>
nnoremap gw :w !sudo tee >/dev/null %<CR> :e!<CR>
nnoremap _ :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> go :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent> gO :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

nnoremap gsi :call syntax#info()<CR>
nnoremap gvg :<C-u>vimgrep<Space><Space>**<Left><Left><Left>
nnoremap <BS> gT
nnoremap <C-l> gt
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nnoremap <C-c> :<C-u>cd<Space>
nnoremap <silent> <Space>.  :<C-u>source $MYVIMRC \| echo 'Source vimrc'<CR>
