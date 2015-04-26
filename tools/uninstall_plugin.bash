#!/bin/bash

# Remove
## Shell
### enhancd
rm -rf ~/.dotfiles/shell/.sh/plugin/enhancd/*

## zsh
### antigen
rm -rf ~/.zsh/bundle/antigen/*
### others
rm -rf ~/.zsh/bundle/repos

## vim
### neobundle
rm -rf ~/.vim/bundle/neobundle.vim/*
rm -rf ~/.vim/bundle/.neobundle
### others
ls ~/.vim/bundle | grep -v neobundle.vim | xargs rm -rf
