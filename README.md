# squirrelmail

Dockerイメージ作るときに使ったやつ

## 実行

    docker run -p 22 -p 80 -d -v /tmp:/tmp squirrelmail:latest /usr/bin/supervisord

## 設定

sshで入って以下のコマンドで再設定

    /etc/squirrelmail/conf.pl

- IMAPの接続情報
- IMAPのTLS接続の有無
    - `2.  Server Settings` => `A.  Update IMAP Settings`
- 言語
    - `10. Languages`
        - `1.  Default Language` => `ja_JP`
        - `2.  Default Charset` => `iso-2022-jp`


