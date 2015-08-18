<p align="center">
<img width=20% src="https://raw.githubusercontent.com/j4ve1in/dotfiles/master/img/dotfiles.png">
</p>

<p align="center">
<b><a href="#概要">概要</a></b>
|
<b><a href="#インストール">インストール</a></b>
|
<b><a href="#設定">設定</a></b>
|
<b><a href="#試行">試行</a></b>
|
<b><a href="#wiki">Wiki</a></b>
|
<b><a href="https://github.com/j4ve1in/dotfiles/blob/master/README.md">English README</a></b>
|
<b><a href="#ライセンス">ライセンス</a></b>
</p>

<p align="center">
<a href="https://waffle.io/j4ve1in/dotfiles"><img src="https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square"></a>
<a href="https://gitter.im/j4ve1in/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge"><img src="https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square"></a>
<a href="https://github.com/j4ve1in/dotfiles/blob/master/LICENSE.md"><img src="https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square"></a>
<a href="https://github.com/j4ve1in/dotfiles/wiki#my-environment"><img src="https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin%20|%20Cygwin-lightgrey.svg?style=flat-square"></a>
</p>

# 概要
このリポジトリはUnix系OSの設定ファイルを管理しています。

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
        -u, --update             ドットファイルをバックアップし、ダウンロード
        -d, --deploy             ドットファイルをホームディレクトリに展開
        -b, --backup             ドットファイルをバックアップディレクトリにバックアップ
        -r, --reinstall          ドットファイルをアンインストールしてからインストールし直す
        -U, --uninstall          ドットファイルをアンインストール
        -l, --list               ドットファイルの一覧表を見る
        -m, --map                ドットファイルのディレクトリマップを見る
        -h, --help               ヘルプを表示する
        -p, --install-plugin     シェルとエディターのプラグインをインストール
        -P, --uninstall-plugin   シェルとエディターのプラグインをアンインストール

# 試行
インストールコマンドを使って、セットアップする前に、**[イメージ](https://hub.docker.com/r/j4ve1in/dotfiles "イメージ")**を引っ張ってきて、Dockerのコンテナ内で試すことができます。

```bash
$ sudo docker pull j4ve1in/dotfiles
$ sudo docker run -it --rm j4ve1in/dotfiles
```

# Wiki
詳細については、**[wiki](https://github.com/j4ve1in/dotfiles/wiki "Wiki")**を見てください。

# ライセンス
Copyright (c) 2015 j4ve1in
MITライセンスのもとで公開されています。**[LICENSE.md](https://github.com/j4ve1in/dotfiles/blob/master/LICENSE.md "LICENSE.md")**を見て下さい。
