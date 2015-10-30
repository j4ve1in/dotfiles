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
<b><a href="//github.com/j4ve1in/dotfiles/blob/master/README.md">English README</a></b>
|
<b><a href="#ライセンス">ライセンス</a></b>
</p>

<p align="center">
<a href="//github.com/j4ve1in/dotfiles/blob/master/LICENSE.md"><img src="https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square"></a>
<a href="//github.com/j4ve1in/dotfiles/wiki#my-environment"><img src="https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin%20|%20Cygwin-lightgrey.svg?style=flat-square"></a>
</p>

# 概要
このリポジトリはUnix系OSの設定ファイルを管理しています。

![Screenshot]

# インストール
以下のインストールコマンドでインストールできます。

| OS                | インストールコマンド                   |
|:-----------------:|:---------------------------------------|
| GNU/Linux, Darwin | bash <(curl -L dot.j4ve1in.com)        |
|                   | bash <(wget -O - dot.j4ve1in.com)      |
| Cygwin            | exec bash <(curl -L dot.j4ve1in.com)   |
|                   | exec bash <(wget -O - dot.j4ve1in.com) |

**参考:** **フルインストール**を利用する場合は`export FULL_INSTALLATION="1"`か`setenv FULL_INSTALLATION="1"`を実行した後、インストールコマンドを実行してください。フルインストールを使うとシェルとエディターのプラグインもインストールできます。

**参考2:** **オートインストール**を利用する場合は`export ASSUME_YES="1"`か`setenv ASSUME_YES="1"`を実行した後、インストールコマンドを実行してください。オートインストールを使うと確認があったときすべて`yes`で進め、非対話的に実行します。

**デモ:**
[![](/img/demo.png)][asciinema]

# 設定
## Dotsetup

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
        -s, --status             ドットファイルと関係があるコマンドのインストール状況を確認
        -r, --reinstall          ドットファイルをアンインストールしてからインストールし直す
        -U, --uninstall          ドットファイルをアンインストール
        -l, --list               ドットファイルの一覧表を見る
        -m, --map                ドットファイルのディレクトリマップを見る
        -h, --help               ヘルプを表示する
        -p, --install-plugin     シェルとエディターのプラグインをインストール
        -P, --uninstall-plugin   シェルとエディターのプラグインをアンインストール

![dotsetup1]
![dotsetup2]

# 試行
インストールコマンドを使って、セットアップする前に、**[イメージ]**を引っ張ってきて、Dockerのコンテナ内で試すことができます。

```bash
$ sudo docker pull j4ve1in/dotfiles
$ sudo docker run -it --rm j4ve1in/dotfiles
```

# Wiki
詳細については、**[wiki]**を見てください。

# ライセンス
Copyright (c) 2015 j4ve1in  
MITライセンスのもとで公開されています。**[LICENSE.md]**を見て下さい。

[Screenshot]: /img/screenshot.png
[asciinema]: //asciinema.org/a/3pumub4jgh5rl6hfkj06nnbd5
[dotsetup1]: /img/dotsetup1.png
[dotsetup2]: /img/dotsetup2.png
[イメージ]: //hub.docker.com/r/j4ve1in/dotfiles
[wiki]: //github.com/j4ve1in/dotfiles/wiki
[LICENSE.md]: //github.com/j4ve1in/dotfiles/blob/master/LICENSE.md
