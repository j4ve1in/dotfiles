" help
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

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

" clipboard
nnoremap Y y$
nnoremap s "_s

" vimgrep
nnoremap gvg :<C-u>vimgrep<Space><Space>**<Left><Left><Left>

" Substitute
nnoremap gs :<C-u>%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>

" .vimrc
nnoremap <silent> <Space>.  :<C-u>edit ~/.vim/rc<CR>
nnoremap <silent> <Space>>  :<C-u>tabedit ~/.vim/rc<CR>
nnoremap <silent> <Space>..  :<C-u>source $MYVIMRC<CR>

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
nnoremap <Space>m :<C-u>set mouse=a ttymouse=xterm2 \| echo 'Mouse: ON'<CR>
nnoremap <Space>M :<C-u>set mouse= \| echo 'Mouse: OFF'<CR>
nnoremap <C-g> 1<C-g>
vnoremap v $h
noremap <Space>v 0v$h
nnoremap <Space>e :<C-u>edit!<CR>
nnoremap <Space>w! :w !sudo tee >/dev/null %<CR> :e!<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent><Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")

nnoremap <silent> <Space>s :call syntax#info()<CR>
