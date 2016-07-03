<p align='center'>
<img width=20% src='https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/dotfiles.png'>
</p>

<p align='center'>
<b><a href='#概要'>概要</a></b>
|
<b><a href='#インストール'>インストール</a></b>
|
<b><a href='#設定'>設定</a></b>
|
<b><a href='#試行'>試行</a></b>
|
<b><a href='//github.com/ytet5uy4/dotfiles/blob/master/README.md'>English README</a></b>
|
<b><a href='#ライセンス'>ライセンス</a></b>
</p>

<p align='center'>
<a href='//github.com/ytet5uy4/dotfiles/blob/master/LICENSE.md'><img src='https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square'></a>
<img src='https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin%20|%20MSYS2-lightgrey.svg?style=flat-square'>
</p>

# 概要
このリポジトリはUnix系OSの設定ファイルを管理しています。

![Screenshot]

# インストール
以下のインストールコマンドでインストールできます。

|      | インストールコマンド                   |
|:----:|:---------------------------------------|
| cURL | zsh <(curl -L d.ytet5uy4.com)          |
| Wget | zsh <(wget -O - d.ytet5uy4.com)        |

**参考:** **フルインストール**を利用する場合はインストールコマンドに
`-f`オプションを指定して実行して下さい。フルインストールを使うと
シェルやエディター、マルチプレキサーのプラグインもインストールできます。

**参考2:** **オートインストール**を利用する場合はインストールコマンドに
`-y`オプションを指定して実行して下さい。オートインストールを使うと
警告等を表示せず、非対話的に実行します。

**デモ:**
<a href="//asciinema.org/a/48340" target="_blank"><img src="https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/demo.png"></a>

# 設定
## Dotsetup

    名前
        dotsetup - DOTfiles SETUP

    書式
        dotsetup [options]

    説明
        dotsetupはドットファイルを管理するコマンドです。

    オプション
        -u, --update             バックアップして、アップデート
        -d, --deploy             ホームディレクトリに展開
        -b, --backup             バックアップブランチにバックアップ
        -r, --reinstall          アンインストールしてからインストールし直す
        -U, --uninstall          アンインストール
        -l, --list               ドットファイルの一覧表を見る
        -h, --help               ヘルプを表示する
        -p, --install-plugin     vimとzshとtmuxのプラグインをインストール
        -P, --uninstall-plugin   vimとzshとtmuxのプラグインをアンインストール

![dotsetup1]
![dotsetup2]

# 試行
インストールコマンドを使って、セットアップする前に、**[イメージ]**を
引っ張ってきて、Dockerのコンテナ内で試すことができます。

```bash
$ docker pull ytet5uy4/dotfiles
$ docker run -it --rm ytet5uy4/dotfiles
```

# ライセンス
Copyright (c) 2015 ytet5uy4  
MITライセンスのもとで公開されています。**[LICENSE.md]**を見て下さい。


[Screenshot]: https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/screenshot.png
[dotsetup1]: https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/dotsetup1.png
[dotsetup2]: https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/dotsetup2.png
[イメージ]: //hub.docker.com/r/ytet5uy4/dotfiles
[LICENSE.md]: //github.com/ytet5uy4/dotfiles/blob/master/LICENSE.md
