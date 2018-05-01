function! plugin#livedown#init() abort
  packadd vim-livedown

  nmap <silent> gm :<C-u>LivedownToggle<CR>
endfunction
