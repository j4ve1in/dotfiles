<p align='center'>
<img width=20% src='https://raw.githubusercontent.com/wiki/ytet5uy4/dotfiles/dotfiles.png'>
</p>

<p align='center'>
<b><a href='#overview'>Overview</a></b>
|
<b><a href='#installation'>Installation</a></b>
|
<b><a href='#trial'>Trial</a></b>
|
<b><a href='#license'>License</a></b>
</p>

<p align='center'>
  <a href='//github.com/ytet5uy4/dotfiles/blob/master/LICENSE.md'>
    <img src='https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square'>
  </a>
  <img src='https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin-lightgrey.svg?style=flat-square'>
</p>


# Overview
This repository manage configuration files on Unix-type operating systems.

![screenshot]

# Installation
You can install dotfiles by the following installation command.

```zsh
% zsh <(curl -L d.ytet5uy4.com)
```

**Requirements:**
* Git
* Zsh

**NOTE:** If you want to use **automatic installation**,
specify the `-y` option. When you use automatic installation,
assume `yes` as answer to all prompts and run non-interactively.

**Demo:**
<a href="//asciinema.org/a/48340" target="_blank"><img src="https://raw.githubusercontent.com/wiki/ytet5uy4/dotfiles/demo.png"></a>

# Trial
Before running installation command to setup dotfiles, you can pull
an **[image]** and try my dotfiles in a Docker container as follows.
```zsh
% docker pull ytet5uy4/dotfiles
% docker run -it --rm ytet5uy4/dotfiles
```

# License
Copyright (c) 2015 ytet5uy4  
Released under the MIT License, see **[LICENSE.md]**.

[screenshot]: https://raw.githubusercontent.com/wiki/ytet5uy4/dotfiles/screenshot.png
[image]: //hub.docker.com/r/ytet5uy4/dotfiles
[LICENSE.md]: //github.com/ytet5uy4/dotfiles/blob/master/LICENSE.md
