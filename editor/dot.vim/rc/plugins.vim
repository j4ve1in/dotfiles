" Netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_home=$HOME.'/.vim/tmp'

" Dein
let s:dein_dir = expand('~/.vim/bundle')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if isdirectory(s:dein_repo_dir)
  execute 'set runtimepath^=' . s:dein_repo_dir

  " Load Plugins
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml = expand('~/.vim/rc/load_plugins.toml')
    let s:lazy_toml = expand('~/.vim/rc/lazyload_plugins.toml')
    call dein#load_toml(s:toml)
    call dein#load_toml(s:lazy_toml, {'lazy' : 1})
    call dein#end()
    call dein#save_state()
  endif

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif

  " Plugins Settings {{{
  augroup rc_autocmd
    autocmd!
  augroup END
    " Unite {{{
    if dein#tap('unite.vim')
      let g:unite_enable_auto_select = 0
      nnoremap [Unite] <Nop>
      nmap <C-Space> [Unite]

      nnoremap <silent> [Unite] :<C-u>Unite<CR>
      nnoremap <silent> [Unite]rg :<C-u>Unite<Space>register<CR>
      nnoremap <silent> [Unite]t :<C-u>Unite<Space>tab<CR>
      nnoremap <silent> [Unite]o :<C-u>Unite<Space>outline<CR>

      " file
      nnoremap <silent> [Unite]f :Unite<Space>file<Space>file/new<Space>directory/new<CR>
      nnoremap <silent> [Unite]F :Unite<Space>file<Space>file/new<Space>directory/new<Space>-default-action=tabopen<CR>

      " file_rec
      nnoremap <silent> [Unite]fr :Unite<Space>file_rec/async<CR>
      nnoremap <silent> [Unite]fR :Unite<Space>file_rec/async<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]fr! :Unite<Space>file_rec/async:!<CR>
      nnoremap <silent> [Unite]fR! :Unite<Space>file_rec/async:!<Space>-default-action=tabopen<CR>

      " directory_rec
      nnoremap <silent> [Unite]dr :<C-u>Unite<Space>directory_rec/async<CR>
      nnoremap <silent> [Unite]Dr :<C-u>Unite<Space>directory_rec/async<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]dr! :<C-u>Unite<Space>directory_rec/async:!<CR>
      nnoremap <silent> [Unite]Dr! :<C-u>Unite<Space>directory_rec/async:!<Space>-default-action=tabopen<CR>

      " git
      nnoremap <silent> [Unite]gf :<C-u>Unite<Space>file_rec/git<CR>
      nnoremap <silent> [Unite]gF :<C-u>Unite<Space>file_rec/git<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]gf :<C-u>Unite<Space>file_rec/git:!<CR>
      nnoremap <silent> [Unite]gF :<C-u>Unite<Space>file_rec/git:!<Space>-default-action=tabopen<CR>

      " file_mru
      nnoremap <silent> [Unite]m :<C-u>Unite<Space>file_mru<CR>
      nnoremap <silent> [Unite]M :<C-u>Unite<Space>file_mru<Space>-default-action=tabopen<CR>

      " help
      nnoremap <silent> [Unite]h :<C-u>Unite<Space>help<CR>
      nnoremap <silent> [Unite]H :<C-u>Unite<Space>help<Space>-default-action=tabopen<CR>

      " find
      nnoremap <silent> [Unite]s :Unite<Space>find:.<CR>
      nnoremap <silent> [Unite]S :Unite<Space>find:.<Space>-default-action=tabopen<CR>

      " ~/.vim/rc/*
      nnoremap <silent> [Unite]. :<C-u>Unite<Space>file<Space>-path=~/.vim/rc<CR>
      nnoremap <silent> [Unite]> :<C-u>Unite<Space>file<Space>-path=~/.vim/rc<Space>-default-action=tabopen<CR>

      " other plugin
      nnoremap <silent> [Unite]d :<C-u>Unite<Space>dein<CR>
      nnoremap <silent> [Unite]T :<C-u>Unite<Space>tweetvim<CR>
      nnoremap <silent> [Unite]w :<C-u>Unite<Space>webcolorname<CR>
      nnoremap <silent> [Unite]hl :<C-u>Unite<Space>highlight<CR>
      nnoremap <silent> [Unite]gi :<C-u>Unite<Space>gista<CR>
      nnoremap <silent> [Unite]gh :<C-u>Unite<Space>ghq<Space>-default-action=rec/async<CR>

      "" giti
      nnoremap <silent> [Unite]g :<C-u>Unite<Space>giti<CR>
      nnoremap <silent> [Unite]gb :<C-u>Unite<Space>giti/branch<CR>
      nnoremap <silent> [Unite]gB :<C-u>Unite<Space>giti/branch_all<CR>
      nnoremap <silent> [Unite]gl :<C-u>Unite<Space>giti/log<CR>
      nnoremap <silent> [Unite]gs :<C-u>Unite<Space>giti/status<CR>

      "" Rails
      nnoremap <silent> [Unite]r :<C-u>Unite<CR>rails/
      nnoremap <silent> [Unite]ra :<C-u>Unite<Space>rails/asset<CR>
      nnoremap <silent> [Unite]rA :<C-u>Unite<Space>rails/asset<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]rm :<C-u>Unite<Space>rails/model<CR>
      nnoremap <silent> [Unite]rM :<C-u>Unite<Space>rails/model<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]rd :<C-u>Unite<Space>rails/db<CR>
      nnoremap <silent> [Unite]rD :<C-u>Unite<Space>rails/db<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]rv :<C-u>Unite<Space>rails/view<CR>
      nnoremap <silent> [Unite]rV :<C-u>Unite<Space>rails/view<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]rc :<C-u>Unite<Space>rails/controller<CR>
      nnoremap <silent> [Unite]rC :<C-u>Unite<Space>rails/controller<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]rco :<C-u>Unite<Space>rails/config<CR>
      nnoremap <silent> [Unite]rcO :<C-u>Unite<Space>rails/config<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]rh :<C-u>Unite<Space>rails/helper<CR>
      nnoremap <silent> [Unite]rH :<C-u>Unite<Space>rails/helper<Space>-default-action=tabopen<CR>

      " grep
      nnoremap <silent> [Unite]/ :<C-u>Unite<Space>grep:.<CR>
      nnoremap <silent> [Unite]? :<C-u>Unite<Space>grep:.<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]/g :<C-u>Unite<Space>grep/git:.<CR>
      nnoremap <silent> [Unite]?g :<C-u>Unite<Space>grep/git:.<Space>-default-action=tabopen<CR>
      if executable('hw')
        let g:unite_source_grep_command = 'hw'
        let g:unite_source_grep_default_opts = '--no-group --no-color'
        let g:unite_source_grep_recursive_opt = ''
      endif

      function! s:unite() abort
        call unite#custom#profile('default', 'context', {
          \ 'start_insert': '1',
          \ 'prompt_direction': 'top',
          \ 'prompt': '> ',
          \ 'candidate_icon': '- ',
          \ 'hide_icon': 0 })

        " ignore patterns
        let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
        call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
        call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)

      endfunction
      execute 'autocmd rc_autocmd User' 'dein#source#' . g:dein#name 'call s:unite()'
    endif
    " }}}

    " VimFiler {{{
    if dein#tap('vimfiler')
      let g:vimfiler_as_default_explorer = 1
      autocmd FileType vimfiler 
            \ nnoremap <buffer><silent>/ 
            \ :<C-u>Unite file -default-action=vimfiler<CR>
      autocmd FileType vimfiler setlocal statusline=VimFiler
      function! s:vimfiler() abort
        call vimfiler#custom#profile('default', 'context', {
              \   'auto_cd' : 1
              \ })
      endfunction
      execute 'autocmd rc_autocmd User' 'dein#source#' . g:dein#name 'call s:vimfiler()'
    endif
    " }}}

    " fugitive {{{
    if dein#tap('vim-fugitive')
      nnoremap [git] <Nop>
      nmap <Space>g [git]

      nnoremap [git]a :<C-u>Git<Space>add<Space>%:p<CR>
      nnoremap [git]aa :<C-u>Git<Space>add<Space>-A<CR>
      nnoremap [git]b :<C-u>Gbrowse<CR>
      nnoremap [git]c :<C-u>Gcommit<CR>
      nnoremap [git]cm :<C-u>Gcommit<Space>-m<Space>''<Left>
      nnoremap [git]cam :<C-u>Gcommit<Space>-am<Space>''<Left>
      nnoremap [git]ch :<C-u>Git<Space>checkout<Space>
      nnoremap [git]cd :<C-u>Gcd<CR>
      nnoremap [git]in :<C-u>Git<Space>init<CR>
      nnoremap [git]s :<C-u>!clear<Space>&&<Space>git<Space>-C<Space>%:p:h<Space>status<Space>-s<Space>-b<Space>&&<Space>git<Space>-C<Space>%:p:h<Space>stash<Space>list<CR>
      nnoremap [git]sw :<C-u>!clear<Space>&&<Space>git<Space>-C<Space>%:p:h<Space>show<CR>
      nnoremap [git]st :<C-u>Git<Space>stash<CR>
      nnoremap [git]stl :<C-u>Git<Space>stash<Space>list<CR>
      nnoremap [git]stp :<C-u>Git<Space>stash<Space>pop<CR>
      nnoremap [git]w :<C-u>Gwrite
      nnoremap [git]r :<C-u>Gread
      nnoremap [git]rm :<C-u>Gremove
      nnoremap [git]m :<C-u>Gmove
    endif
    " }}}

    " vim-gitgutter {{{
    if dein#tap('vim-gitgutter')
      nnoremap [git] <Nop>
      nmap <Space>g [git]

      nnoremap <silent> [git]g :<C-u>GitGutterToggle<CR>
      let g:gitgutter_enabled = 0
      highlight clear SignColumn
    endif
    " }}}

    " vim-dispatch {{{
    if dein#tap('vim-dispatch')
      nnoremap [dispatch] <Nop>
      nmap <Space>dp [dispatch]
      nnoremap [dispatch] :<C-u>Dispatch<Space>
      nnoremap [dispatch]c :<C-u>Copen<CR>
      nnoremap [dispatch]r :<C-u>Start<Space>irb<CR>
      nnoremap [dispatch]h :<C-u>Start<Space>ghci<CR>

      nnoremap [git] <Nop>
      nmap <Space>g [git]

      nnoremap [git]f :<C-u>Dispatch<Space>git<Space>-C<Space>%:p:h<Space>fetch<Space>--prune<CR>
      nnoremap [git]p :<C-u>Dispatch<Space>git<Space>-C<Space>%:p:h<Space>pull<Space>--prune<CR>
      nnoremap [git]ps :<C-u>Dispatch<Space>git<Space>-C<Space>%:p:h<Space>push<CR>
      nnoremap [git]cl :<C-u>Dispatch<Space>git<Space>-C<Space>%:p:h<Space>clone<Space>
      nnoremap [git]m :<C-u>Dispatch<Space>git<Space>-C<Space>%:p:h<Space>merge<Space>--no-ff<CR>
      nnoremap [git]h :<C-u>Dispatch<Space>ghq<Space>get<Space>
    endif
    " }}}

    " vim-gista {{{
    if dein#tap('vim-gista')
      nnoremap [git] <Nop>
      nmap <Space>g [git]

      nnoremap [git]i :<C-u>Gista<Space>--post<Space>--description<Space>''<Left>
      nnoremap [git]ip :<C-u>Gista<Space>--post<Space>--public<Space>--description<Space>''<Left>
      nnoremap [git]il :<C-u>Gista<Space>--list<CR>
      nnoremap [git]ic :<C-u>tabedit<Space><Space>\|<Space>:set<Space>ro
                  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
      let g:gista#post_private = '1'
    endif
    " }}}

    " Watchdogs {{{
    if dein#tap('vim-watchdogs')
      nnoremap [Watchdogs] <Nop>
      nmap <Space>W [Watchdogs]

      nnoremap <silent> [Watchdogs] :<C-u>WatchdogsRun<CR>
    endif
    " }}}

    " TweetVim {{{
    if dein#tap('TweetVim')
      let g:tweetvim_display_icon = 1
      let g:tweetvim_display_source = 1
      let g:tweetvim_tweet_per_page = 60
      let g:tweetvim_config_dir = expand('~/.vim/tmp/tweetvim')
    endif
    " }}}

    " Previm {{{
    if dein#tap('previm')
      nnoremap [Previm] <Nop>
      nmap <Space>pv [Previm]

      nnoremap <silent> [Previm] :<C-u>PrevimOpen<CR>
    endif
    " }}}

    " auto-save {{{
    if dein#tap('vim-auto-save')
      let g:auto_save = 1
      let g:auto_save_in_insert_mode = 0
    endif
    " }}}

    " indent-guides {{{
    if dein#tap('vim-indent-guides')
      let g:indent_guides_auto_colors=0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=247
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239
      let g:indent_guides_enable_on_vim_startup=1
      let g:indent_guides_color_change_percent=30
      let g:indent_guides_guide_size=1
      let g:indent_guides_exclude_filetypes = ['help', 'calendar', 'thumbnail', 'tweetvim', 'man', 'vimfiler', 'diff']
    endif
    " }}}

    " open-browser {{{
    if dein#tap('open-browser.vim')
      let g:netrw_nogx = 1
      nmap gx <Plug>(openbrowser-smart-search)
      vmap gx <Plug>(openbrowser-smart-search)
    endif
    " }}}

    " vim-smartinput-endwise {{{
    if dein#tap('vim-smartinput-endwise')
      function! s:vim_smartinput_endwise() abort
        call smartinput_endwise#define_default_rules()
        call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)','<BS>','<BS>')
        call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)','<BS>','<C-h>')
        call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)','<Enter>','<Enter>')
        imap <expr><BS> neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"
        imap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<Plug>(smartinput_CR)"
      endfunction
      execute 'autocmd rc_autocmd User' 'dein#source#' . g:dein#name 'call s:vim_smartinput_endwise()'
    endif
    " }}}

    " NeoComplete {{{
    if dein#tap('neocomplete.vim')
      let g:neocomplete#enable_at_startup = 1
      let g:neocomplete#enable_smart_case = 1
      let g:neocomplete#enable_auto_select = 1
      let g:neocomplete#sources#syntax#min_keyword_length = 3
      let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

      " Define dictionary.
      let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

      if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
      endif
      let g:neocomplete#keyword_patterns['default'] = '\h\w*'

      " Plugin key-mappings.
      inoremap <expr><C-g>     neocomplete#undo_completion()
      inoremap <expr><C-l>     neocomplete#complete_common_string()
      inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
      " inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
      " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
      inoremap <expr><C-y>  neocomplete#close_popup()
      inoremap <expr><C-e>  neocomplete#cancel_popup()
      inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
      function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
      endfunction

      " Enable omni completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

      let g:neocomplete#sources#omni#input_patterns      = {'go': '\h\w\.\w*'}

      if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
      endif
      let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

      " Enable heavy omni completion.
      if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
      endif
      let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    endif
    " }}}

    " NeoSnippet {{{
    if dein#tap('neosnippet')
      " Plugin key-mappings.
      imap <C-k>     <Plug>(neosnippet_expand_or_jump)
      smap <C-k>     <Plug>(neosnippet_expand_or_jump)
      xmap <C-k>     <Plug>(neosnippet_expand_target)

      " SuperTab like snippets behavior.
      imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

      " For conceal markers.
      if has('conceal')
        set conceallevel=2 concealcursor=niv
      endif
    endif
    " }}}

    " vim-operator-flashy {{{
    if dein#tap('vim-operator-flashy')
      map y <Plug>(operator-flashy)
      nmap Y <Plug>(operator-flashy)$
      highlight Flashy ctermfg=0 ctermbg=26
    endif
    " }}}

    " incsearch.vim {{{
    if dein#tap('incsearch.vim')
      let g:incsearch#no_inc_hlsearch = 1
      map /  <Plug>(incsearch-forward)
      map ?  <Plug>(incsearch-backward)
      map g/ <Plug>(incsearch-stay)
    endif
    " }}}

    " caw.vim {{{
    if dein#tap('caw.vim')
      nmap <Space>c <Plug>(caw:i:toggle)
      vmap <Space>c <Plug>(caw:i:toggle)
    endif
    " }}}

    " unite-cmdmatch {{{
    if dein#tap('unite-cmdmatch')
      cmap <c-o> <Plug>(unite_cmdmatch_complete)
    endif
    " }}}

    " vim-table-mode {{{
    if dein#tap('vim-table-mode')
      let g:loaded_table_mode = 1
    endif
    " }}}

    " editorconfig-vim {{{
    if dein#tap('editorconfig-vim')
      let g:EditorConfig_exclude_patterns = ['gista:*', 'scp://.*']
    endif
    " }}}

    " vim-submode {{{
    if dein#tap('vim-submode')
      function! s:vim_submode() abort
        call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
        call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
        call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
        call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
        call submode#map('winsize', 'n', '', '>', '<C-w>>')
        call submode#map('winsize', 'n', '', '<', '<C-w><')
        call submode#map('winsize', 'n', '', '+', '<C-w>+')
        call submode#map('winsize', 'n', '', '-', '<C-w>-')
        call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
        call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
        call submode#map('changetab', 'n', '', 't', 'gt')
        call submode#map('changetab', 'n', '', 'T', 'gT')
        call submode#enter_with('tabmove', 'n', '', '<Space>t>', ':tabmove<Space>+1<CR>')
        call submode#enter_with('tabmove', 'n', '', '<Space>t<', ':tabmove<Space>-1<CR>')
        call submode#map('tabmove', 'n', '', '>', ':tabmove<Space>+1<CR>')
        call submode#map('tabmove', 'n', '', '<', ':tabmove<Space>-1<CR>')
        call submode#enter_with('ex-move', 'nv', '', '<Space><Space>', '<Nop>')
        call submode#leave_with('ex-move', 'nv', '', '<Space>')
        call submode#map('ex-move', 'nv', '', 'j', '<C-f>zz')
        call submode#map('ex-move', 'nv', '', 'k', '<C-b>zz')
        call submode#map('ex-move', 'nv', '', 'n', '5jzz')
        call submode#map('ex-move', 'nv', '', 'm', '5kzz')
        call submode#map('ex-move', 'nv', '', 'l', '}zz')
        call submode#map('ex-move', 'nv', '', 'h', '{zz')
      endfunction
    execute 'autocmd rc_autocmd User' 'dein#source#' . g:dein#name 'call s:vim_submode()'
    endif
    " }}}

    " vim-multiple-cursors {{{
    if dein#tap('vim-multiple-cursors')
      let g:multi_cursor_start_key='<C-s>'
    endif
    " }}}

    " yankround.vim {{{
    if dein#tap('yankround.vim')
      nmap p <Plug>(yankround-p)
      xmap p <Plug>(yankround-p)
      nmap P <Plug>(yankround-P)
      nmap gp <Plug>(yankround-gp)
      xmap gp <Plug>(yankround-gp)
      nmap gP <Plug>(yankround-gP)
      nmap <C-p> <Plug>(yankround-prev)
      nmap <C-n> <Plug>(yankround-next)
      let g:yankround_max_history = 5
    endif
    " }}}

    " lightline {{{
    if dein#tap('lightline.vim')
      let s:white  = 255
      let s:black  = 0
      let s:blue   = 17
      let s:lightblue = 26
      let s:cyan = 6
      let s:purple = 54
      let s:gray = 235

      let s:p = {
            \ 'normal':   {},
            \ 'inactive': {},
            \ 'insert':   {},
            \ 'replace':  {},
            \ 'visual':   {},
            \ 'tabline':  {}}

      let s:p.normal.middle = [['', '', s:white, 'none']]
      let s:p.normal.left = [
            \ ['', '', s:white, s:blue],
            \ ['', '', s:white, s:lightblue]]
      let s:p.normal.right = [
            \ ['', '', s:white, s:blue],
            \ ['', '', s:white, s:lightblue]]

      let s:p.inactive.middle = [['', '', s:white, s:gray]]
      let s:p.inactive.right = [
            \ s:p.inactive.middle[0],
            \ s:p.inactive.middle[0]]
      let s:p.inactive.left = [
            \ s:p.inactive.middle[0],
            \ s:p.inactive.middle[0]]

      let s:p.insert.left = [
            \ ['', '', s:black, s:white],
            \ s:p.normal.left[1]]
      let s:p.replace.left = [
            \ ['', '', s:white, s:cyan],
            \ s:p.normal.left[1]]
      let s:p.visual.left = [
            \ ['', '', s:white, s:purple],
            \ s:p.normal.left[1]]

      let s:p.tabline.middle = [['', '', s:white, 'none']]
      let s:p.tabline.right = [
            \ ['', '', s:white, s:blue],
            \ ['', '', s:blue, 'none']]
      let s:p.tabline.left = [['', '', s:white, s:black]]
      let s:p.tabline.tabsel = [['', '', s:white, s:blue]]
      let g:lightline#colorscheme#abisso#palette = s:p
      let g:lightline = {
            \ 'colorscheme': 'abisso',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],[ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'modified': 'LightLineModified',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode'
            \ },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }

      function! LightLineModified()
        if &filetype == "help"
          return ""
        elseif &modified
          return "+"
        elseif &modifiable
          return ""
        else
          return ""
        endif
      endfunction

      function! LightLineFugitive()
        try
          if exists('*fugitive#head')
            let mark = "\ue0a0 "
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
          endif
        catch
        endtry
        return ''
      endfunction

      function! LightLineFileformat()
        return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
      endfunction

      function! LightLineFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
      endfunction

      function! LightLineFileencoding()
        return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
      endfunction

      function! LightLineMode()
        return winwidth(0) > 60 ? lightline#mode() : ''
      endfunction

      set noshowmode
    endif
    " }}}

    " eskk {{{
    if dein#tap('eskk.vim')
      let g:eskk#directory = expand('$CACHE/eskk')
      let g:eskk#large_dictionary = {
        \   'path': '/usr/share/skk/SKK-JISYO.L',
        \   'sorted': 1,
        \   'encoding': 'euc-jp',
        \}
      let g:eskk#server = {
        \ 'host': 'localhost',
        \ 'port': 55100
        \}
      let g:eskk#marker_henkan = "\uf13a"
      let g:eskk#marker_henkan_select = "\uf107"
    endif
    " }}}
  " }}}
endif
