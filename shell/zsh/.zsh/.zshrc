# Compile
## ~/.zsh/.zshrc
file=".zsh/.zshrc"
if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
    zcompile ~/${file}
fi

## ~/.zshrc.d/*.zshrc
for file in .zshrc.d/*.zshrc; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
    fi
done

## ~/.zshrc.function.d/*.zshrc
for file in .zshrc.function.d/*.zshrc; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
    fi
done

## ~/.zshrc.plugin.d/*.zshrc
for file in .zshrc.plugin.d/*.zshrc; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
    fi
done

# Load
## Plugin
for file in ~/.zshrc.plugin.d/*.zshrc; do
    source ${file}
done

## Function
for file in ~/.zshrc.function.d/*.zshrc; do
    source ${file}
done

## ~/.zshrc.d/*.zshrc
for file in ~/.zshrc.d/*.zshrc; do
    source ${file}
done

## alias
source ~/.aliases

## keychain
source ~/.keychain.autoload

## TMUX
source ~/.tmux.autoload
