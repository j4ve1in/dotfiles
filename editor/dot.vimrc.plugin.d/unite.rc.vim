nnoremap [Unite] <Nop>
nmap <Space>u [Unite]

nnoremap <silent> [Unite] :<C-u>Unite<CR>
nnoremap <silent> [Unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [Unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [Unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [Unite]a :<C-u>Unite<Space>buffer<Space>file<Space>file_mru<Space>bookmark<CR>
nnoremap <silent> [Unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [Unite]R :<C-u>UniteResume<CR>

nnoremap <silent> [Unite]c :<C-u>Unite<Space>colorscheme<Space>-auto-preview<CR>
nnoremap <silent> [Unite]n :<C-u>Unite<Space>neobundle<CR>
nnoremap <silent> [Unite]nu :<C-u>Unite<Space>neobundle/update<CR>
nnoremap <silent> [Unite]nl :<C-u>Unite<Space>neobundle/log<CR>
nnoremap <silent> [Unite]nL :<C-u>Unite<Space>neobundle/lazy<CR>
nnoremap <silent> [Unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [Unite]t :<C-u>Unite<Space>tweetvim<CR>
nnoremap <silent> [Unite]g :<C-u>Unite<Space>giti<CR>
nnoremap <silent> [Unite]rv :<C-u>Unite<Space>rails/view<CR>
nnoremap <silent> [Unite]rm :<C-u>Unite<Space>rails/model<CR>
nnoremap <silent> [Unite]rc :<C-u>Unite<Space>rails/controller<CR>
nnoremap <silent> [Unite]rco :<C-u>Unite<Space>rails/config<CR>
nnoremap <silent> [Unite]rd :<C-u>Unite<Space>rails/db<CR>

let g:unite_enable_start_insert = 1
let g:unite_enable_auto_select = 0
