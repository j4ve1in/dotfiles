# Load ~/.shrc.d/*.sh
SHRC=(
  "aliases"
  "function"
  "last"
)
for file in ${SHRC[@]}; do
  file=~/.shrc.d/${file}.sh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v SHRC file

if [ `uname` != Darwin ]; then
  eval `dircolors -b ~/.dir_colors`
fi

stty stop undef
