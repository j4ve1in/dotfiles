# Plugin
source ~/.bashrc.d/plugin.bashrc

# Load ~/.bashrc.d/*.bashrc
filepath="$HOME/.bashrc.d/*.bashrc"
for file in ${filepath}; do
    source ${file}
done

# alias
source ~/.aliases

# keychain
source ~/.keychain.autoload

# TMUX
source ~/.tmux.autoload
