nnoremap [Unite] <Nop>
nmap <Space>u [Unite]

nnoremap <silent> [Unite] :<C-u>Unite<CR>
nnoremap <silent> [Unite]A :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [Unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [Unite]B :<C-u>Unite<Space>bookmark<Space>-default-action=tabopen<CR>
nnoremap <silent> [Unite]F :<C-u>Unite<Space>file<Space>-default-action=tabopen<CR>
nnoremap <silent> [Unite]f :<C-u>call DispatchUniteFileRecAsyncOrGit()<Space>-default-action=tabopen<CR>
nnoremap <silent> [Unite]m :<C-u>Unite<Space>file_mru<Space>-default-action=tabopen<CR>
nnoremap <silent> [Unite]a :<C-u>Unite<Space>buffer<Space>file<Space>file_mru<Space>bookmark<CR>
nnoremap <silent> [Unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [Unite]R :<C-u>UniteResume<CR>
nnoremap <silent> [Unite]t :<C-u>Unite<Space>tab<CR>

nnoremap <silent> [Unite]n :<C-u>Unite<Space>neobundle<CR>
nnoremap <silent> [Unite]T :<C-u>Unite<Space>tweetvim<CR>

let g:unite_enable_start_insert = 1
let g:unite_enable_auto_select = 0
