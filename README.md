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
<b><a href="//github.com/j4ve1in/dotfiles/blob/master/README.ja.md">Japanese README</a></b>
|
<b><a href="#license">License</a></b>
</p>

<p align="center">
<a href="//github.com/j4ve1in/dotfiles/blob/master/LICENSE.md"><img src="https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square"></a>
<a href="//github.com/j4ve1in/dotfiles/wiki#my-environment"><img src="https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin%20|%20Cygwin-lightgrey.svg?style=flat-square"></a>
</p>


# Overview
This repository manage **[my]** configuration files on Unix-type operating systems.

![Screenshot]

# Installation
You can install Javelin's dotfiles by the following installation command.

| OS                | Installation command                   |
|:-----------------:|:---------------------------------------|
| GNU/Linux, Darwin | bash <(curl -L dot.j4ve1in.com)        |
|                   | bash <(wget -O - dot.j4ve1in.com)      |
| Cygwin            | exec bash <(curl -L dot.j4ve1in.com)   |
|                   | exec bash <(wget -O - dot.j4ve1in.com) |

**NOTE:** If you want to use **full installation**, run `export FULL_INSTALLATION="1"` or `setenv FULL_INSTALLATION="1"` and installation command in your terminal. When you use full installation, install shell and editor plugin, too.

**NOTE2:** If you want to use **automatic installation**, run `export ASSUME_YES="1"` or `setenv ASSUME_YES="1"` and installation command in your terminal. When you use automatic installation, assume "yes" as answer to all prompts and run non-interactively.

**Demo:**
[![](/img/demo.png)][asciinema]

# Configurations
## Dotsetup

    NAME
        dotsetup - DOTfiles SETUP

    SYNOPSIS
        dotsetup [options]

    DESCRIPTION
        Dotsetup is dotfile's setup command.

    OPTIONS
        -u, --update             Backup and download dotfiles
        -d, --deploy             Deploy dotfiles to home directory
        -b, --backup             Backup dotfiles to backup directory
        -s, --status             Check installed commands
        -r, --reinstall          Install dotfiles again after uninstalling
        -U, --uninstall          Uninstall dotfile
        -l, --list               View dotfile's list
        -m, --map                View dotfile's directory map
        -h, --help               View help
        -p, --install-plugin     Install shell and editor plugin
        -P, --uninstall-plugin   Uninstall shell and editor plugin

![dotsetup1]
![dotsetup2]

# Test with Docker
Before running installation command to setup dotfiles, you can pull an **[image]** and try my dotfiles in a Docker container as follows.
```bash
$ sudo docker pull j4ve1in/dotfiles
$ sudo docker run -it --rm j4ve1in/dotfiles
```

# Wiki
Please have a look at the **[wiki]** for more information.

# License
Copyright (c) 2015 j4ve1in  
Released under the MIT License, see **[LICENSE.md]**.

[my]: //github.com/j4ve1in
[Screenshot]: /img/screenshot.png
[asciinema]: //asciinema.org/a/5wpuq69gg9u1dl0pbfvxjntxg
[dotsetup1]: /img/dotsetup1.png
[dotsetup2]: /img/dotsetup2.png
[image]: //hub.docker.com/r/j4ve1in/dotfiles
[wiki]: //github.com/j4ve1in/dotfiles/wiki
[LICENSE.md]: //github.com/j4ve1in/dotfiles/blob/master/LICENSE.md
