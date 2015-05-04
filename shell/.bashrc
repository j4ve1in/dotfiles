# Load ~/.bashrc.d/*.rc.bash
filepath="$HOME/.bashrc.d/*.rc.bash"
for file in ${filepath}; do
  source ${file}
done

# alias
source ~/.shrc.d/aliases.rc.sh

# keychain
source ~/.shrc.d/keychain.autoload.rc.sh

# TMUX
source ~/.shrc.d/tmux.autoload.rc.sh
