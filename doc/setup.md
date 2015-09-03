セットアップ手順
================


ターミナル インストール
-----------------------

[GitHub for Windows](https://windows.github.com) をダウンロード/インストールする。  
GitHub を起動し、 [Options] から下記の通り設定する。  

* Configure git
    * Git で使うユーザ名/メールアドレスを入力。
* Default shell
    * [Git Bash] を選択。

以後、同梱の Git Shell をターミナルとして使う。  


GitHub 接続設定
---------------

SSH認証鍵を作成する。  

```
$ ssh-keygen -t rsa -N "" -f ~/.ssh/github
```

作成した鍵を使用するように設定する。  

```
$ vi ~/.ssh/config
Host github.com
    IdentityFile ~/.ssh/github
```

[GitHub](https://github.com/settings/ssh) にSSH公開鍵を登録する。

```
$ cat ~/.ssh/github.pub
```


Virtual Box インストール
------------------------

[Virtual Box](https://www.virtualbox.org) をダウンロード/インストールする。  


Vagrant インストール
--------------------

[Vagrant](http://www.vagrantup.com) をダウンロード/インストールする。  

Vagrantプラグインをインストールする。  

```
$ vagrant plugin install vagrant-vbguest
```


リポジトリクローン
------------------

本リポジトリをクローンする。  

```
$ git clone git@github.com:akihyro/orenux.git
$ cd orenux
```


ゲストOS 構築/起動
------------------

ゲストOSを構築/起動する。  

```
$ vagrant up
```
