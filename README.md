<p align="center">
<img width=20% src="https://raw.githubusercontent.com/j4ve1in/dotfiles/master/img/dotfiles.png">
</p>

<p align="center">
<b><a href="#overview">Overview</a></b>
|
<b><a href="#installation">Installation</a></b>
|
<b><a href="#configurations">Configurations</a></b>
|
<b><a href="#test-with-docker">Test with Docker</a></b>
|
<b><a href="#wiki">Wiki</a></b>
|
<b><a href="https://github.com/j4ve1in/dotfiles/blob/master/README.ja.md">Japanese README</a></b>
|
<b><a href="#license">License</a></b>
</p>

<p align="center">
<a href="https://waffle.io/j4ve1in/dotfiles"><img src="https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square"></a>
<a href="https://gitter.im/j4ve1in/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge"><img src="https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square"></a>
<a href="https://github.com/j4ve1in/dotfiles/blob/master/LICENSE.md"><img src="https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square"></a>
<a href="https://github.com/j4ve1in/dotfiles/wiki#my-environment"><img src="https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin%20|%20Cygwin-lightgrey.svg?style=flat-square"></a>
</p>


# Overview
This repository manage **[my](https://github.com/j4ve1in "my")** configuration files on Unix-type operating systems.

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

# Test with Docker
Before running installation command to setup dotfiles, you can try my dotfiles in a Docker container as follows.
```bash
$ sudo docker pull j4ve1in/dotfiles
$ sudo docker run -it --rm j4ve1in/dotfiles
```

# Wiki
Please have a look at the **[wiki](https://github.com/j4ve1in/dotfiles/wiki "Wiki")** for more information.

# License
Copyright (c) 2015 j4ve1in
Released under the MIT License, see **[LICENSE.md](https://github.com/j4ve1in/dotfiles/blob/master/LICENSE.md "LICENSE.md")**.
