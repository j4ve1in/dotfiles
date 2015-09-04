nnoremap <C-h><C-h>      :<C-u>help<Space>
nnoremap <C-h><C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <Space>/ *
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

nnoremap <Leader>btt :tab ball<CR>

" Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>

" Tab
nnoremap [Tab] <Nop>
nmap <Leader>t [Tab]
nnoremap <silent> [Tab] :tabs<CR>
nnoremap [Tab]e :tabedit<Space>
nnoremap <silent> [Tab]n :tabnew<CR>
nnoremap <silent> [Tab]c :tabclose<CR>
