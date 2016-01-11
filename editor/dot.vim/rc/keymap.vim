nnoremap Y y$
nnoremap j gj
nnoremap k gk
vnoremap v $h
nnoremap H <C-i>
nnoremap L <C-o>
nnoremap <C-k> {
nnoremap <C-j> }
cnoremap <C-a> <C-b>
nnoremap <C-g> 1<C-g>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
nnoremap <Space>/ *
noremap <Space>v 0v$h
noremap <Space>pw :<C-u>pwd<CR>
map <Space>i gg=<S-g><C-o><C-o>zz
nnoremap <C-h>h :<C-u>help<Space>
nnoremap <Space>e :<C-u>edit!<CR>
nnoremap <Space>d :<C-u>!mkdir<Space>
nnoremap <Space>enc :<C-u>e ++encoding=""<Left>
nnoremap <Space>ff  :<C-u>e ++fileformat=""<Left>
nnoremap <Space>w! :w !sudo tee >/dev/null %<CR> :e!<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent><Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
nnoremap <silent> <Space><ESC>
\  :<C-u>highlight CursorLine cterm=none ctermbg=24 ctermfg=24<CR> \|
\  :<C-u>sleep 1ms<CR> \|
\  :<C-u>highlight clear CursorLine<CR>
\  :<C-u>highlight CursorLine cterm=none ctermbg=24 ctermfg=24<CR> \|
\  :<C-u>sleep 1ms<CR> \|
\  :<C-u>highlight clear CursorLine<CR>

" clipboard
if has( "clipboard" )
  vmap <Space>y "+y
  vmap <Space>Y "+Y
  vmap <Space>d "+d
  vmap <Space>D "+D
  vmap <Space>p "+p
  vmap <Space>P "+P
  nmap <Space>y "+y
  nmap <Space>Y "+Y
  nmap <Space>d "+d
  nmap <Space>D "+D
  nmap <Space>p "+p
  nmap <Space>P "+P
endif

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

" Buffer
nnoremap [Buffer] <Nop>
nmap <Space>b [Buffer]
nnoremap <silent> [Buffer] :buffers<CR>
nnoremap [Buffer]e :buffer<Space>
nnoremap [Buffer]<C-n> :bnext<CR>
nnoremap [Buffer]<C-p> :bprevious<CR>
nnoremap <silent> [Buffer]d :bdelete<CR>
nnoremap [Buffer]t :tabnew<Space>\|<Space>b<Space>

" Tab
nnoremap [Tab] <Nop>
nmap <Space>t [Tab]
nnoremap <silent> [Tab] :tabs<CR>
nnoremap [Tab]e :tabedit<Space>
nnoremap K :tabnext<CR>
nnoremap J :tabprevious<CR>
nnoremap <silent> [Tab]n :tabnew<CR>
nnoremap <silent> [Tab]c :tabclose<CR>
nnoremap <silent> [Tab]o :tabonly<CR>

" C-Space
if has('unix') && !has('gui_running')
  map <NUL> <C-Space>
  map! <NUL> <C-Space>
endif

" for small devise
nnoremap <silent> <Space>w :<C-u>w<CR>
nnoremap <silent> <Space>q :<C-u>q<CR>
nnoremap <silent> <Space>qa :<C-u>qa<CR>
nnoremap <silent> <Space>Q :<C-u>q!<CR>
nnoremap <Space>j <C-f>
vnoremap <Space>j <C-f>
nnoremap <Space>k <C-b>
vnoremap <Space>k <C-b>
