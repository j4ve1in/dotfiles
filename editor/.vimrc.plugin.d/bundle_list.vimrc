" Load Plugins
NeoBundleFetch 'Shougo/neobundle.vim'

" Unite
NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload': {
\     'commands': [ 'Unite' ]
\   }
\ }

NeoBundleLazy 'Shougo/vimfiler', {
\   'depends': [ 'Shougo/unite.vim' ],
\   'autoload': {
\       'commands': [ 'VimFilerTab', 'VimFiler', 'VimFilerExplorer' ]
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

" Git
NeoBundleLazy 'cohama/agit.vim', {
\   'autoload': {
\     'commands': [ 'Agit', 'AgitFile' ]
\   }
\ }

" Twitter
NeoBundleLazy 'basyura/TweetVim', {
\   'depends': [
\     'tyru/open-browser.vim',
\     'basyura/twibill.vim',
\     'mattn/webapi-vim',
\     'Shougo/unite-outline',
\     'basyura/bitly.vim',
\     'Shougo/unite.vim',
\     'mattn/favstar-vim'
\   ],
\   'autoload': {
\     'commands': [
\       'TweetVimAccessToken',
\       'TweetVimAddAccount',
\       'TweetVimBitly',
\       'TweetVimClearIcon',
\       'TweetVimCommandSay',
\       'TweetVimCurrentLineSay',
\       'TweetVimHomeTimeLine',
\       'TweetVimVimListStatuses',
\       'TweetVimMentions',
\       'TweetVimSay',
\       'TweetVimSearch',
\       'TweetVimSwitchAccount',
\       'TweetVimUserStream',
\       'TweetVimUserTimeline',
\       'TweetVimVersion'
\     ]
\   }
\ }

" Syntax

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

" Completion
NeoBundleLazy 'mattn/emmet-vim', {
\   'autoload': { 'filetypes': [ 'html' ] }
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

" Others
NeoBundle 'Townk/vim-autoclose' "abbreviateで括弧に書き換える時支障が出る

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

NeoBundle 'Shougo/vimproc.vim', {
\   'build': {
\     'windows': 'tools\\update-dll-mingw',
\     'cygwin': 'make -f make_cygwin.mak',
\     'mac': 'make -f make_mac.mak',
\     'linux': 'make',
\     'unix': 'gmake'
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

" Load Plugins Settings
source ~/.vimrc.plugin.d/netrw.vimrc

if ! empty(neobundle#get('TweetVim'))
  source ~/.vimrc.plugin.d/tweetvim.vimrc
endif

if ! empty(neobundle#get('vim-auto-save'))
  source ~/.vimrc.plugin.d/autosave.vimrc
endif

if ! empty(neobundle#get('vim-indent-guides'))
  source ~/.vimrc.plugin.d/indent_guides.vimrc
endif

if ! empty(neobundle#get('open-browser.vim'))
  source ~/.vimrc.plugin.d/open_browser.vimrc
endif

if s:meet_neocomplete_requirements()
  if ! empty(neobundle#get('neocomplete.vim'))
    source ~/.vimrc.plugin.d/neocomplete.vimrc
  endif
else
  if ! empty(neobundle#get('neocomplcache.vim'))
    source ~/.vimrc.plugin.d/neocomplcache.vimrc
  endif
endif
