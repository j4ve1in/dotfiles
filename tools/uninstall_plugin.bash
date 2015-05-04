#!/bin/bash

# Remove
## zsh
### antigen
rm -rf ~/.zsh/bundle/antigen
### others
rm -rf ~/.zsh/bundle/repos

## vim
### neobundle
rm -rf ~/.vim/bundle/.neobundle
### others
ls ~/.vim/bundle | xargs rm -rf
