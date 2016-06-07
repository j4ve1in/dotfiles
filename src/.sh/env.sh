has() { type $1 >/dev/null 2>&1; }

export LANG='en_US.UTF-8'
export TERM='xterm-256color'
export PAGER='less'
if [ -n "$DISPLAY" ]; then
  has chromium && export BROWSER='chromium'
else
  has w3m && export BROWSER='w3m'
fi
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Ruby
has ruby && export KCODE='u' # RUBYGEMS_GEMDEPS='-'

# Go
has go && [ -d "${HOME}/.local" ] && export GOPATH="${HOME}/.local"

# Editor
has vim && export EDITOR='vim -p' || export EDITOR='vi -p'

# Less
export LESS='-ciMR'
LESS_TERMCAP_mb=`echo "\e[1;31m"`
LESS_TERMCAP_md=`echo "\e[1;38;05;75m"`
LESS_TERMCAP_me=`echo "\e[0m"`
LESS_TERMCAP_se=`echo "\e[0m"`
LESS_TERMCAP_so=`echo "\e[1;44m"`
LESS_TERMCAP_ue=`echo "\e[0m"`
LESS_TERMCAP_us=`echo "\e[1;36m"`
export LESS_TERMCAP_{mb,md,me,se,so,ue,us}

# Path
[ "$OSTYPE" = "msys" ] && [ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"
[ "$OSTYPE" = "msys" ] && [ -d "/usr/bin" ] && PATH="/usr/bin:$PATH"
[ -d "${HOME}/.local/bin" ] && PATH+=":${HOME}/.local/bin"
[ -d "${HOME}/.dotfiles/bin" ] && PATH+=":${HOME}/.dotfiles/bin"
[ -d "${HOME}/.tmux/bin" ] && PATH+=":${HOME}/.tmux/bin"
[ -d "${HOME}/.xmonad/bin" ] && PATH+=":${HOME}/.xmonad/bin"
[ -d '/usr/local/heroku' ] && PATH+=':/usr/local/heroku/bin'

## Anyenv
if [ -d "${HOME}/.anyenv" ] ; then
  PATH="${HOME}/.anyenv/bin:$PATH"
  eval "`anyenv init -`"
  for D in `ls $HOME/.anyenv/envs`; do
    PATH="${HOME}/.anyenv/envs/$D/shims:$PATH"
  done
fi

export PATH

# Others
case "`uname -s`" in
  MSYS*) export MSYS='winsymlinks';;
  Darwin) export LSCOLORS='gxfxcxdxbxegedabagacad' ;;
esac
export LS_COLORS='
rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01
or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44
ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31
*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31
*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31
*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31
*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31
*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31
*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35
*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35
*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35
*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35
*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35
*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35
*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35
*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35
*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36
*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36
*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36
*.xspf=00;36
'

unset -f has
