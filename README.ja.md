<p align="center">
<img width=20% src="https://raw.githubusercontent.com/j4ve1in/dotfiles/master/img/dotfiles.png">
</p>

<p align="center">

<b><a href="#javelin's-dotfiles">概要</a></b>
|
<b><a href="#インストール">インストール</a></b>
|
<b><a href="#設定">設定</a></b>
|
<b><a href="https://github.com/j4ve1in/dotfiles/blob/master/README.md">English README</a></b>
</p>

[![Waffle.io](https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square "Waffle.io")](https://waffle.io/j4ve1in/dotfiles)
[![Gitter](https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square "Gitter")](https://gitter.im/j4ve1in/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Javelin's Dotfiles
![Screenshot](/img/screenshot.png "Screenshot")

# インストール
以下のインストールコマンドでインストールできます。

| OS                | インストールコマンド                        |
|:-----------------:|:--------------------------------------------|
| GNU/Linux, Darwin | bash -c "$(curl -L dot.j4ve1in.com)"        |
|                   | bash -c "$(wget -O - dot.j4ve1in.com)"      |
| Cygwin            | exec bash -c "$(curl -L dot.j4ve1in.com)"   |
|                   | exec bash -c "$(wget -O - dot.j4ve1in.com)" |

**参考:** **フルインストール**を利用する場合は`export FULL_INSTALLATION="1"`か`setenv FULL_INSTALLATION="1"`を実行した後、インストールコマンドを実行してください。フルインストールを使うとシェルとエディターのプラグインもインストールできます。

**参考2:** **オートインストール**を利用する場合は`export ASSUME_YES="1"`か`setenv ASSUME_YES="1"`を実行した後、インストールコマンドを実行してください。オートインストールを使うと確認があったときすべて`yes`で進め、非対話的に実行します。

**デモ:**
![Demo](/img/demo.gif "Demo")

# 設定
## Dotsetup
![dotsetup](/img/dotsetup.png "dotsetup")

    名前
        dotsetup - DOTfiles SETUP

    書式
        dotsetup [options]

    説明
        dotsetupはドットファイルを管理するコマンドです。

    オプション
        -u, --update         ドットファイルをアップデート
        -b, --backup         ドットファイルをバックアップ
        -r, --reinstall      ドットファイルを再インストール
        -U, --uninstall      ドットファイルをアンインストール
        -h, --help           ヘルプを表示する
        --install-plugin     シェルとエディターのプラグインをインストール
        --uninstall-plugin   シェルとエディターのプラグインをアンインストール
