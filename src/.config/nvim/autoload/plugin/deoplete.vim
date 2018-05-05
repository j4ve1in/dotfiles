function! plugin#deoplete#init() abort
  packadd deoplete.nvim

  call deoplete#custom#option({
  \ 'smart_case': v:true,
  \ 'max_list': 5,
  \ 'min_pattern_length': 1,
  \ })
  call deoplete#custom#option('auto_complete_delay', 0)
  call deoplete#custom#option('ignore_sources', {'_': ['around','buffer']})

  call deoplete#enable()

  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><S-TAB> pumvisible()?"\<c-p>":""
endfunction
