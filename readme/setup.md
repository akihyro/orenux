俺用 Linux 仮想環境 - 環境構築
==============================


Virtual Box インストール
------------------------

[Virtual Box](https://www.virtualbox.org) をダウンロード/インストールする。


Vagrant インストール
--------------------

[Vagrant](http://www.vagrantup.com) をダウンロード/インストールする。


Vagrant プラグイン インストール (必須)
--------------------------------------

Vagrantプラグインをインストールする。

* vagrant-omnibus
    * ゲストOSに Chef をインストール, 実行してくれる。
* vagrant-vbguest
    * Guest Additions を自動でアップデートしてくれる。
    * このバージョンが古くなると、共有フォルダの利用が出来ない等の問題に苛まれることがある。これを防ぐ。
* vagrant-proxyconf
    * ゲストOSにプロキシを設定してくれる。

```
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-vbguest
$ vagrant plugin install vagrant-proxyconf
```


Vagrant プラグイン インストール (任意)
--------------------------------------

Vagrantプラグインをインストールする。

* vagrant-cachier
    * ゲストOS内のyumパッケージ等をホストOS側にキャッシュしてくれる。
* vagrant-pristine
    * `vagrant pristine` で `vagrant destroy && vagrant up` をサクっと実行。
* sahara
    * sandboxモードをONにすれば、ゲストOSの状態をロールバック/コミット可能になる。
* vagrant-vbox-snapshot
    * ゲストOSのスナップショットを取得/復元できる。

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


仮想環境 構築/起動
------------------

仮想環境を構築/起動する。

```
$ vagrant up
```
