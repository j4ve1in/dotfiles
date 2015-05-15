<p align="center">
<img width=20% src="https://raw.githubusercontent.com/j4ve1in/dotfiles/master/img/dotfiles.png">
</p>

<p align="center">

<b><a href="#javelin's-dotfiles">About</a></b>
|
<b><a href="#installation">Installation</a></b>
|
<b><a href="#configurations">Configurations</a></b>
|
<b><a href="https://github.com/j4ve1in/dotfiles/wiki">Wiki</a></b>
|
<b><a href="https://github.com/j4ve1in/dotfiles/blob/master/README.ja.md">Japanese README</a></b>
</p>

[![Waffle.io](https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square "Waffle.io")](https://waffle.io/j4ve1in/dotfiles)
[![Gitter](https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square "Gitter")](https://gitter.im/j4ve1in/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# [Javelin](https://github.com/j4ve1in)'s Dotfiles
![Screenshot](/img/screenshot.png "Screenshot")

# Installation
You can install Javelin's dotfiles by the following installation command.

| OS                | Installation command                        |
|:-----------------:|:--------------------------------------------|
| GNU/Linux, Darwin | bash -c "$(curl -L dot.j4ve1in.com)"        |
|                   | bash -c "$(wget -O - dot.j4ve1in.com)"      |
| Cygwin            | exec bash -c "$(curl -L dot.j4ve1in.com)"   |
|                   | exec bash -c "$(wget -O - dot.j4ve1in.com)" |

**NOTE:** If you want to use **full installation**, run `export FULL_INSTALLATION="1"` or `setenv FULL_INSTALLATION="1"` and installation command in your terminal. When you use full installation, install shell and editor plugin, too.

**NOTE2:** If you want to use **automatic installation**, run `export ASSUME_YES="1"` or `setenv ASSUME_YES="1"` and installation command in your terminal. When you use automatic installation, assume "yes" as answer to all prompts and run non-interactively.

**Demo:**
![Demo](/img/demo.gif "Demo")

# Configurations
## Dotsetup
![dotsetup](/img/dotsetup.png "dotsetup")

    NAME
        dotsetup - DOTfiles SETUP

    SYNOPSIS
        dotsetup [options]

    DESCRIPTION
        Dotsetup is dotfile's setup command.

    OPTIONS
        -u, --update          Update dotfiles
        -b, --backup          Backup dotfiles
        -r, --reinstall       Reinstall dotfiles
        -U, --uninstall       Uninstall dotfiles
        -l, --list            View dotfile's list
        -m, --directory-map   View dotfile's directory map
        -h, --help            View help
        --install-plugin      Install shell and editor plugin
        --uninstall-plugin    Uninstall shell and editor plugin
