# Load ~/.sh/*.sh
[ "$OSTYPE" = "msys" ] && SHRC=('env')
SHRC+=(
  'base'
  'aliases'
  'function'
  'local'
)
for file in ${SHRC[@]}; do
  file=~/.sh/${file}.sh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v SHRC file
