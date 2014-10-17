環境構築手順 - ゲストOS 環境構築手順
====================================


Virtual Box インストール
------------------------

[Virtual Box](https://www.virtualbox.org) をダウンロード/インストールする。


Vagrant インストール
--------------------

[Vagrant](http://www.vagrantup.com) をダウンロード/インストールする。


Vagrant プラグイン インストール (必須)
--------------------------------------

Vagrantプラグインをインストールする。

```
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-vbguest
$ vagrant plugin install vagrant-proxyconf
```


Vagrant プラグイン インストール (任意)
--------------------------------------

Vagrantプラグインをインストールする。

```
$ vagrant plugin install vagrant-cachier
$ vagrant plugin install vagrant-pristine
$ vagrant plugin install sahara
$ vagrant plugin install vagrant-vbox-snapshot
```


リポジトリクローン
------------------

本リポジトリをクローンする。

```
$ git clone https://github.com/akihyro/orenux.git
```


ゲストOS 構築/起動
------------------

ゲストOSを構築/起動する。

```
$ vagrant up
```
