環境構築手順 - ホストOS 環境設定手順
====================================


ターミナル インストール
-----------------------

[GitHub for Windows](https://windows.github.com) をダウンロード/インストールする。  
GitHub を起動し、 [Options] から下記の通り設定する。  

* Configure git
    * Git で使うユーザ名/メールアドレスを入力。
* Default shell
    * [Git Bash] を選択。

以後、同梱の Git Shell をターミナルとして使う。  


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
