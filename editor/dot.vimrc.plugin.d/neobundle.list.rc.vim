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

NeoBundle 'ekalinin/Dockerfile.vim'

" }}}

" Completion " {{{
NeoBundleLazy 'mattn/emmet-vim', {
\   'autoload': {
\     'filetypes': [
\       'html',
\       'css',
\       'sass',
\       'scss',
\       'eruby'
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

NeoBundle 'kana/vim-submode'

NeoBundle 'Townk/vim-autoclose'

NeoBundle 'rhysd/accelerated-jk'

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
" }}}

" Source Plugins Settings " {{{
" NeoBundle " {{{
nnoremap [NeoBundle] <Nop>
nmap <Space>n [NeoBundle]

nnoremap <silent> [NeoBundle]l :<C-u>NeoBundleList<CR>
nnoremap <silent> [NeoBundle]L :<C-u>NeoBundleLog<CR>
nnoremap <silent> [NeoBundle]u :<C-u>NeoBundleUpdate<CR>
" }}}

" Unite " {{{
if neobundle#tap('unite.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/unite.rc.vim'
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
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/vimfiler.rc.vim'
  call neobundle#untap()
endif
" }}}

" Watchdogs " {{{
if neobundle#tap('vim-watchdogs')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/watchdogs.rc.vim'
  call neobundle#untap()
endif
" }}}

" TweetVim " {{{
if neobundle#tap('TweetVim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/tweetvim.rc.vim'
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
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/autosave.rc.vim'
  call neobundle#untap()
endif
" }}}

" indent-guides " {{{
if neobundle#tap('vim-indent-guides')
" }}}
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/indent-guides.rc.vim'
  call neobundle#untap()
endif
" }}}

" open-browser " {{{
if neobundle#tap('open-browser.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/open-browser.rc.vim'
  call neobundle#untap()
endif
" }}}

" NeoComplete and NeoComplcache " {{{
if s:meet_neocomplete_requirements()
  if neobundle#tap('neocomplete.vim')
    let neobundle#hooks.on_source = '~/.vimrc.plugin.d/neocomplete.rc.vim'
    call neobundle#untap()
  endif
else
  if neobundle#tap('neocomplcache.vim')
    let neobundle#hooks.on_source = '~/.vimrc.plugin.d/neocomplcache.rc.vim'
    call neobundle#untap()
  endif
endif
" }}}

" NeoSnippet " {{{
if neobundle#tap('neosnippet')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/neosnippet.rc.vim'
  call neobundle#untap()
endif
" }}}

" Accelerated-jk " {{{
if neobundle#tap('accelerated-jk')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/accelerated-jk.rc.vim'
  call neobundle#untap()
endif
" }}}
" }}}
