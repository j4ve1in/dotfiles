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

NeoBundleLazy 'Shougo/unite-outline', {
\   'depends': [ 'Shougo/unite.vim' ],
\   'autoload': {
\       'commands': [ 'Unite outline' ]
\   }
\ }

NeoBundleLazy 'Shougo/vimfiler', {
\   'depends': [ 'Shougo/unite.vim' ],
\   'autoload': {
\       'commands': [ 'VimFilerTab', 'VimFiler', 'VimFilerExplorer' ]
\   }
\ }

NeoBundleLazy 'ujihisa/unite-colorscheme', {
\   'depends': [ 'Shougo/unite.vim' ],
\   'autoload': {
\     'commands': [ 'Unite colorscheme' ]
\   }
\ }

NeoBundleLazy 'pasela/unite-webcolorname', {
\   'depends': [ 'Shougo/unite.vim' ],
\   'autoload': {
\     'commands': [ 'Unite webcolorname' ]
\   }
\ }

NeoBundleLazy 'kmnk/vim-unite-giti', {
\   'depends': [ 'Shougo/unite.vim' ],
\   'autoload': {
\     'commands': [ 'Unite' ]
\   }
\ }
" }}}

" Git " {{{
NeoBundleLazy 'cohama/agit.vim', {
\   'autoload': {
\     'commands': [ 'Agit', 'AgitFile' ]
\   }
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
" }}}

" Others " {{{
NeoBundle 'Townk/vim-autoclose'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'vim-scripts/vim-auto-save'

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

NeoBundle 'tyru/open-browser.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'surround.vim'

NeoBundleLazy 'Shougo/vimshell.vim', {
\   'autoload': {
\     'commands': [ 'VimShell' ]
\   }
\ }

NeoBundleLazy 'cocopon/colorswatch.vim', {
\   'autoload': {
\     'commands': [ 'ColorSwatchGenerate' ]
\   }
\ }

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'scrooloose/nerdcommenter'

NeoBundleFetch 'supermomonga/thingspast.vim'

NeoBundleFetch 'itchyny/lightline.vim'
" }}}

" Source Plugins Settings " {{{
"" NeoBundle
nnoremap [NeoBundle] <Nop>
nmap <Space>n [NeoBundle]

nnoremap <silent> [NeoBundle]l :<C-u>NeoBundleList<CR>
nnoremap <silent> [NeoBundle]L :<C-u>NeoBundleLog<CR>
nnoremap <silent> [NeoBundle]u :<C-u>NeoBundleUpdate<CR>

if neobundle#tap('unite.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/unite.rc.vim'
endif

if neobundle#tap('vimfiler')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/vimfiler.rc.vim'
endif

if neobundle#tap('vimshell.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/vimshell.rc.vim'
endif

if neobundle#tap('vim-watchdogs')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/watchdogs.rc.vim'
endif

if neobundle#tap('TweetVim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/tweetvim.rc.vim'
endif

if neobundle#tap('agit.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/agit.rc.vim'
endif

if neobundle#tap('previm')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/previm.rc.vim'
endif

if neobundle#tap('vim-auto-save')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/autosave.rc.vim'
endif

if neobundle#tap('vim-indent-guides')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/indent-guides.rc.vim'
endif

if neobundle#tap('colorswatch.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/colorswatch.rc.vim'
endif

if neobundle#tap('open-browser.vim')
  let neobundle#hooks.on_source = '~/.vimrc.plugin.d/open-browser.rc.vim'
endif

if s:meet_neocomplete_requirements()
  if neobundle#tap('neocomplete.vim')
    let neobundle#hooks.on_source = '~/.vimrc.plugin.d/neocomplete.rc.vim'
  endif
else
  if neobundle#tap('neocomplcache.vim')
    let neobundle#hooks.on_source = '~/.vimrc.plugin.d/neocomplcache.rc.vim'
  endif
endif
" }}}
