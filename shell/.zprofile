# Compile
## ~/.zsh/.zshrc
file=".zsh/.zshrc"
if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
    zcompile ~/${file}
    echo "Compiled ${file}"
fi

## ~/.zshrc.d/*.rc.zsh
for file in .zshrc.d/*.rc.zsh; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
        echo "Compiled ${file}"
    fi
done

## ~/.zshrc.function.d/*.rc.zsh
for file in .zshrc.function.d/*.rc.zsh; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
        echo "Compiled ${file}"
    fi
done

## ~/.zshrc.plugin.d/*.rc.zsh
for file in .zshrc.plugin.d/*.rc.zsh; do
    if [ ! -f ~/${file}.zwc -o ~/${file} -nt ~/${file}.zwc ]; then
        zcompile ~/${file}
        echo "Compiled ${file}"
    fi
done
