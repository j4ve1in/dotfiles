#!/bin/zsh
ADOTDIR=$HOME/.zsh/bundle
source ~/.zsh/bundle/antigen/antigen.zsh
{ sleep 1; antigen update; } | env LESS="-cE" less
