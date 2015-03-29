# Plugin
source ~/.bashrc.d/plugin.bashrc

# Load ~/.bashrc.d/*.bashrc
filepath="$HOME/.bashrc.d/*.bashrc"
for file in ${filepath}; do
    source ${file}
done

# alias
source ~/.shrc.d/aliases.shrc

# keychain
source ~/.shrc.d/keychain.autoload.shrc

# TMUX
source ~/.shrc.d/tmux.autoload.shrc
