環境構築手順 - ホストOS 環境設定手順
====================================


msysgit インストール (Windowsユーザ向け)
----------------------------------------

Windowsユーザは、 [msysgit](http://msysgit.github.io) をダウンロード/インストールする。  
以後、同梱の Git Bash をターミナルとして使う。  


プロキシ設定 (プロキシ利用環境向け)
-----------------------------------

プロキシが必要な環境に居る場合は、プロキシを設定する。  

```
$ vi ~/.bashrc
export http_proxy="..."
export HTTP_PROXY=$http_proxy
export https_proxy="..."
export HTTPS_PROXY=$https_proxy
export no_proxy="localhost,127.0.0.1"
export NO_PROXY=$no_proxy

$ . ~/.bashrc
```


GitHub SSL接続用 アクセストークン 発行
--------------------------------------

GitHub接続用のアクセストークンを発行する。  
※既にアクセストークンを持っている場合は、それを利用してもOK。  


GitHub SSL接続用 アクセストークン 設定
--------------------------------------

GitHub接続用のアクセストークンを自動ログイン情報に設定する。  

```
$ vi ~/.netrc
machine     github.com
login       {ユーザ名}
password    {アクセストークン}
```


GitHub SSH接続用 認証鍵 作成
----------------------------

GitHub接続用のSSH認証鍵を作成する。  
※既に鍵を持っている場合は、それを利用してもOK。  

```
$ ssh-keygen -t rsa -N "" -f ~/.ssh/github_rsa
```

作成した鍵を使うように設定する。  

```
$ vi ~/.ssh/config
Host github.com
	IdentityFile ~/.ssh/github_rsa
```


GitHub SSH接続用 公開鍵 登録
----------------------------

GitHubに公開鍵を登録する。  

```
$ cat ~/.ssh/github_rsa.pub
```
