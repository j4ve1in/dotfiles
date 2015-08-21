let g:rails_level=4

nnoremap [vim-rails] <Nop>
nmap <Space>r [vim-rails]

nnoremap <silent> [vim-rails] :<C-u>R<CR>
nnoremap <silent> [vim-rails]a :<C-u>A<CR>
nnoremap <silent> [vim-rails]m :<C-u>Emodel<Space>
nnoremap <silent> [vim-rails]c :<C-u>Econtroller<Space>
nnoremap <silent> [vim-rails]v :<C-u>Eview<Space>
nnoremap <silent> [vim-rails]l :<C-u>Elib<CR>
nnoremap <silent> [vim-rails]s :<C-u>Emigration<CR>

autocmd User Rails.view* NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller* NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/* NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip
