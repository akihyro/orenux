俺用 Linux 仮想環境
===================

環境構築
--------

### Virtual Box インストール

[Virtual Box](https://www.virtualbox.org) をダウンロード/インストール。

### Vagrant インストール

[Vagrant](http://www.vagrantup.com) をダウンロード/インストール。

### Vagrant プラグイン インストール (必須)

```sh
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-vbguest
```

### Vagrant プラグイン インストール (任意)

```sh
$ vagrant plugin install vagrant-cachier
$ vagrant plugin install vagrant-pristine
$ vagrant plugin install sahara
```

### チェックアウト

本リポジトリをチェックアウト。

### 仮想環境 起動

仮想環境を起動。

```sh
$ vagrant up
```
