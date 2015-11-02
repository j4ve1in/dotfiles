" Source plugin settings
" Netrw
let g:netrw_liststyle=3
let b:netrw_islocal=0
let g:netrw_home=$HOME.'/.vim/var/tmp/plugin'

" NeoBundle
if !1 | finish | endif

if isdirectory(expand('~/.vim/bundle/neobundle.vim'))
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  let g:neobundle#log_filename = $HOME.'/.vim/var/tmp/plugin/neobundle.log'

  call neobundle#begin(expand('~/.vim/bundle/'))

  " Load Plugins
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Important
  NeoBundle 'Shougo/vimproc.vim', {
  \   'build': {
  \     'windows': 'tools\\update-dll-mingw',
  \     'cygwin': 'make -f make_cygwin.mak',
  \     'mac': 'make -f make_mac.mak',
  \     'linux': 'make',
  \     'unix': 'gmake'
  \   }
  \ }

  " Unite " {{{
  NeoBundleLazy 'Shougo/unite.vim', {
  \   'autoload': {
  \     'commands': [ 'Unite' ]
  \   }
  \ }

  NeoBundle 'Shougo/neomru.vim', {
  \   'depends': [ 'Shougo/unite.vim' ]
  \ }

  NeoBundle 'Shougo/vimfiler', {
  \   'depends': [ 'Shougo/unite.vim' ]
  \ }
  " }}}

  " Twitter " {{{
  NeoBundle 'basyura/TweetVim', {
  \   'depends': [
  \     'tyru/open-browser.vim',
  \     'basyura/twibill.vim',
  \     'mattn/webapi-vim',
  \     'Shougo/unite-outline',
  \     'basyura/bitly.vim',
  \     'Shougo/unite.vim',
  \     'mattn/favstar-vim'
  \   ]
  \ }
  " }}}

  " Syntax " {{{
  NeoBundleLazy "osyo-manga/vim-watchdogs", {
  \   'depends': [
  \     'thinca/vim-quickrun',
  \     'Shougo/vimproc.vim',
  \     'osyo-manga/shabadou.vim',
  \     'cohama/vim-hier',
  \     'dannyob/quickfixstatus'
  \   ],
  \   'autoload': {
  \     'commands': [
  \       'WatchdogsRun',
  \       'WatchdogsRunSilent',
  \       'WatchdogsRunSweep'
  \     ]
  \   }
  \ }

  NeoBundleLazy 'othree/html5.vim', {
  \   'autoload': { 'filetypes': [ 'html' ] }
  \ }

  NeoBundleLazy 'hail2u/vim-css3-syntax', {
  \   'autoload': { 'filetypes': [ 'css' ] }
  \ }

  NeoBundleLazy 'ekalinin/Dockerfile.vim', {
  \   'autoload': { 'filetypes': [ 'dockerfile' ] }
  \ }

  NeoBundle 'slim-template/vim-slim'

  " NeoBundleLazy 'slim-template/vim-slim', {
  " \   'autoload': { 'filetypes': [ 'slim' ] }
  " \ }

  NeoBundle 'slim-template/vim-slim'

  " }}}

  " Completion " {{{
  NeoBundleLazy 'mattn/emmet-vim', {
  \   'autoload': {
  \     'filetypes': [
  \       'html',
  \       'css',
  \       'sass',
  \       'scss',
  \       'eruby',
  \       'markdown'
  \     ]
  \   }
  \ }

  function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
  endfunction

  if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache.vim'
  else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
  endif

  NeoBundle 'Shougo/neosnippet-snippets', {
  \   'depends': [ 'Shougo/neosnippet' ]
  \ }
  " }}}

  " Others " {{{
  NeoBundle 'surround.vim'

  NeoBundle 'vim-jp/vimdoc-ja'

  NeoBundle 'kana/vim-submode'

  NeoBundle 'Townk/vim-autoclose'

  NeoBundle 'Shougo/vimshell.vim'

  NeoBundle 'haya14busa/incsearch.vim'

  NeoBundle 'easymotion/vim-easymotion'

  NeoBundle 'scrooloose/nerdcommenter'

  NeoBundle 'vim-scripts/vim-auto-save'

  NeoBundle 'editorconfig/editorconfig-vim'

  NeoBundle 'nathanaelkane/vim-indent-guides'

  NeoBundleLazy 'kannokanno/previm', {
  \   'depends': [
  \     'tyru/open-browser.vim',
  \   ],
  \   'autoload': {
  \     'commands': [
  \       'Previm',
  \       'PrevimOpen'
  \     ]
  \   }
  \ }

  NeoBundleFetch 'itchyny/lightline.vim'

  " NeoBundleLazy 'ujihisa/unite-colorscheme', {
  " \   'depends': [ 'Shougo/unite.vim' ],
  " \   'autoload': {
  " \     'commands': [ 'Unite colorscheme' ]
  " \   }
  " \ }

  " NeoBundleLazy 'pasela/unite-webcolorname', {
  " \   'depends': [ 'Shougo/unite.vim' ],
  " \   'autoload': {
  " \     'commands': [ 'Unite webcolorname' ]
  " \   }
  " \ }
  " }}}

  " Source Plugins Settings " {{{
    " NeoBundle " {{{
    nnoremap [NeoBundle] <Nop>
    nmap <Space>n [NeoBundle]

    nnoremap <silent> [NeoBundle] :<C-u>NeoBundleUpdate<CR>
    nnoremap <silent> [NeoBundle]l :<C-u>NeoBundleLog<CR>
    " }}}

    " Unite " {{{
    if neobundle#tap('unite.vim')
      nnoremap [Unite] <Nop>
      nmap <C-Space> [Unite]
      nmap <Space>u [Unite]

      nnoremap <silent> [Unite] :<C-u>Unite<CR>
      nnoremap <silent> [Unite]b :<C-u>Unite<Space>buffer<CR>
      nnoremap <silent> [Unite]rg :<C-u>Unite<Space>register<CR>
      nnoremap <silent> [Unite]rs :<C-u>UniteResume<CR>
      nnoremap <silent> [Unite]t :<C-u>Unite<Space>tab<CR>
      nnoremap <silent> [Unite]w :<C-u>Unite<Space>window<CR>

      " file
      nnoremap <silent> [Unite]f :Unite<Space>file<CR>
      nnoremap <silent> [Unite]F :Unite<Space>file<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]n :Unite<Space>file/new<CR>
      nnoremap <silent> [Unite]N :Unite<Space>file/new<Space>-default-action=tabopen<CR>

      " directory
      nnoremap <silent> [Unite]nd :Unite<Space>directory/new<CR>

      " file_rec
      nnoremap <silent> [Unite]r :Unite<Space>file_rec<CR>
      nnoremap <silent> [Unite]R :Unite<Space>file_rec<Space>-default-action=tabopen<CR>
      nnoremap <silent> [Unite]r! :Unite<Space>file_rec/async:!<CR>
      nnoremap <silent> [Unite]R! :Unite<Space>file_rec/async:!<Space>-default-action=tabopen<CR>

      " file_mru
      nnoremap <silent> [Unite]m :<C-u>Unite<Space>file_mru<CR>
      nnoremap <silent> [Unite]M :<C-u>Unite<Space>file_mru<Space>-default-action=tabopen<CR>

      " directory_mru
      nnoremap <silent> [Unite]dm :<C-u>Unite<Space>directory_mru<CR>
      nnoremap <silent> [Unite]dM :<C-u>Unite<Space>directory_mru<Space>-default-action=tabopen<CR>

      nnoremap <silent> [Unite]nb :<C-u>Unite<Space>neobundle<CR>
      nnoremap <silent> [Unite]T :<C-u>Unite<Space>tweetvim<CR>

      let g:unite_enable_auto_select = 0
      let g:unite_enable_start_insert = 1
      autocmd BufEnter,BufWinEnter \[unite\]* highlight! link CursorLine PmenuSel
      autocmd BufLeave \[unite\]* highlight! link CursorLine NONE
      let s:hooks = neobundle#get_hooks("unite.vim")
      function! s:hooks.on_source(bundle)
        call unite#custom#profile('default', 'context', {
          \ 'prompt_direction': 'top',
          \ 'prompt': '> ',
          \ 'candidate_icon': '- ',
          \ 'hide_icon': 0 })

        " ignore patterns
        let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
        call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
        call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)

        " NeoBundle
        let neobundle_toggle = { 'is_selectable': 1 }
        function! neobundle_toggle.func(candidates)
          for candidate in a:candidates
            let bundle = candidate.action__bundle_name
            let cmd = neobundle#is_sourced(bundle) ?
            \ 'NeoBundleDisable ' : 'NeoBundleSource '
            exec cmd . bundle
          endfor
        endfunction
        call unite#custom#action('neobundle', 'source', neobundle_toggle)
        call unite#custom#default_action('neobundle', 'source')
      endfunction
      unlet s:hooks
      call neobundle#untap()
    endif
    " }}}

    " VimFiler " {{{
    if neobundle#tap('vimfiler')
      nnoremap [VimFiler] <Nop>
      nmap <Space>f [VimFiler]

      nnoremap <silent> [VimFiler] :<C-u>VimFiler<CR>
      nnoremap <silent> [VimFiler]t :<C-u>VimFilerTab<CR>
      nnoremap <silent> [VimFiler]b :<C-u>VimFilerBufferDir<CR>
      nnoremap <silent> [VimFiler]d :<C-u>VimFilerDouble<CR>
      nnoremap <silent> [VimFiler]e :<C-u>VimFilerExplorer<CR>
      let g:vimfiler_as_default_explorer = 1
      let g:vimfiler_enable_auto_cd = 1
      autocmd FileType vimfiler 
            \ nnoremap <buffer><silent>/ 
            \ :<C-u>Unite file -default-action=vimfiler<CR>
      autocmd FileType vimfiler setlocal statusline=VimFiler
      let s:hooks = neobundle#get_hooks("vimfiler.vim")
      function! s:hooks.on_source(bundle)
        call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
      endfunction
      unlet s:hooks
      call neobundle#untap()
    endif
    " }}}

    " VimShell " {{{
    if neobundle#tap('vimshell.vim')
      nnoremap [VimShell] <Nop>
      nmap <Space>s [VimShell]

      nnoremap <silent> [VimShell] :<C-u>VimShell<CR>
      nnoremap <silent> [VimShell]t :<C-u>VimShellTab<CR>
      call neobundle#untap()
    endif
    " }}}

    " Watchdogs " {{{
    if neobundle#tap('vim-watchdogs')
      nnoremap [Watchdogs] <Nop>
      nmap <Space>W [Watchdogs]

      nnoremap <silent> [Watchdogs] :<C-u>WatchdogsRun<CR>
      call neobundle#untap()
    endif
    " }}}

    " TweetVim " {{{
    if neobundle#tap('TweetVim')
      let g:tweetvim_display_icon = 1
      let g:tweetvim_display_source = 1
      let g:tweetvim_tweet_per_page = 60
      let g:tweetvim_config_dir = expand('~/.vim/var/tmp/plugin/tweetvim')

      nnoremap [TweetVim] <Nop>
      nmap <Space>t [TweetVim]

      nnoremap <silent> [TweetVim] :<C-u>TweetVimHomeTimeline<CR>
      nnoremap <silent> [TweetVim]m :<C-u>TwetVimMentions<CR>
      nnoremap <silent> [TweetVim]s :<C-u>TweetVimSay<CR>
      call neobundle#untap()
    endif
    " }}}

    " Previm " {{{
    if neobundle#tap('previm')
      nnoremap [Previm] <Nop>
      nmap <Space>p [Previm]

      nnoremap <silent> [Previm] :<C-u>PrevimOpen<CR>
      call neobundle#untap()
    endif
    " }}}

    " auto-save " {{{
    if neobundle#tap('vim-auto-save')
      let g:auto_save = 1
      let g:auto_save_in_insert_mode = 0
      call neobundle#untap()
    endif
    " }}}

    " indent-guides " {{{
    if neobundle#tap('vim-indent-guides')
      let g:indent_guides_auto_colors=0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=247
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239
      let g:indent_guides_enable_on_vim_startup=1
      let g:indent_guides_color_change_percent=30
      let g:indent_guides_guide_size=1
      let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim', 'man', 'vimfiler']
      call neobundle#untap()
    endif
    " }}}

    " open-browser " {{{
    if neobundle#tap('open-browser.vim')
      let g:netrw_nogx = 1
      nmap gx <Plug>(openbrowser-smart-search)
      vmap gx <Plug>(openbrowser-smart-search)
      call neobundle#untap()
    endif
    " }}}

    " NeoComplete and NeoComplcache " {{{
    if s:meet_neocomplete_requirements()
    " NeoComplete " {{{
      if neobundle#tap('neocomplete.vim')
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
              \ 'default' : '',
              \ 'vimshell' : $HOME.'/.vimshell_hist',
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
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
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

        if !exists('g:neocomplete#force_omni_input_patterns')
          let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        call neobundle#untap()
      endif
    " }}}
    else
      " NeoComplcache " {{{
      if neobundle#tap('neocomplcache.vim')
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
              \ 'default' : '',
              \ 'vimshell' : $HOME.'/.vimshell_hist',
              \ 'scheme' : $HOME.'/.gosh_completions'
              \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
          let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return neocomplcache#smart_close_popup() . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_force_omni_patterns')
          let g:neocomplcache_force_omni_patterns = {}
        endif
        let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        call neobundle#untap()
      endif
      " }}}
    endif
    " }}}

    " NeoSnippet " {{{
    if neobundle#tap('neosnippet')
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
      call neobundle#untap()
    endif
    " }}}

    " incsearch.vim " {{{
    if neobundle#tap('incsearch.vim')
      map /  <Plug>(incsearch-forward)
      map ?  <Plug>(incsearch-backward)
      map g/ <Plug>(incsearch-stay)
      call neobundle#untap()
    endif
    " }}}

    " vim-submode " {{{
      let s:hooks = neobundle#get_hooks("vim-submode")
      function! s:hooks.on_source(bundle)
        call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
        call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
        call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
        call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
        call submode#map('winsize', 'n', '', '>', '<C-w>>')
        call submode#map('winsize', 'n', '', '<', '<C-w><')
        call submode#map('winsize', 'n', '', '+', '<C-w>-')
        call submode#map('winsize', 'n', '', '-', '<C-w>+')
        call submode#enter_with('ex-move', 'nv', '', '<Space><Space>', '<Nop>')
        call submode#leave_with('ex-move', 'nv', '', '<Space>')
        call submode#map('ex-move', 'nv', '', 'j', '<C-f>zz')
        call submode#map('ex-move', 'nv', '', 'k', '<C-b>zz')
        call submode#map('ex-move', 'nv', '', 'n', '5jzz')
        call submode#map('ex-move', 'nv', '', 'm', '5kzz')
        call submode#map('ex-move', 'nv', '', 'l', '}zz')
        call submode#map('ex-move', 'nv', '', 'h', '{zz')
      endfunction
      unlet s:hooks
    " }}}

  " }}}

  call neobundle#end()

  filetype plugin indent on

  NeoBundleCheck
endif
