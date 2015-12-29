# Load ~/.shrc.d/*.sh
SHRC=(
  "base"
  "aliases"
  "function"
  "local"
)
for file in ${SHRC[@]}; do
  file=~/.shrc.d/${file}.sh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v SHRC file
