# Compile
## ~/.zsh/.zshrc
file=".zsh/.zshrc"
if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
    zcompile ~/${file}
fi

## ~/.zshrc.d/*.rc.zsh
for file in .zshrc.d/*.rc.zsh; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
    fi
done

## ~/.zshrc.function.d/*.rc.zsh
for file in .zshrc.function.d/*.rc.zsh; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
    fi
done

## ~/.zshrc.plugin.d/*.rc.zsh
for file in .zshrc.plugin.d/*.rc.zsh; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
    fi
done

# Load
## Plugin
for file in ~/.zshrc.plugin.d/*.rc.zsh; do
    source ${file}
done

## Function
for file in ~/.zshrc.function.d/*.rc.zsh; do
    source ${file}
done

## ~/.zshrc.d/*.rc.zsh
for file in ~/.zshrc.d/*.rc.zsh; do
    source ${file}
done

## alias
source ~/.shrc.d/aliases.rc.sh

## keychain
source ~/.shrc.d/keychain.autoload.rc.sh

## TMUX
source ~/.shrc.d/tmux.autoload.rc.sh
