# ①アプリケーションについて
## URL
URL:  現在進行中
github: https://github.com/Nakanisi-Kanta/youapp
## 概要
- アプリケーション名:「PUSHAR」
- 内容：プログラミング学習に特化したURLを共有するためのアプリケーション
- 作成理由：プログラミング学習は、ほとんどがURLを叩いて行われていて、そのURLのみを共有できればプログラミング学習の進捗がかなり早くなると思った。



# ②アプリケーションの詳細について
## 機能
- ログイン機能(firebase)
- パスワード再設定(firebase)
- URL投稿機能(CRUD),modalによる投稿画面
- URL検索機能(Vueでのリアルタイム検索)
- アバター, 画像保存機能(activestorage)
- password,email,user編集機能
- 自分の投稿へのピックアップ機能
- 投稿へのストック機能
- フォロー,フォロワー機能

## 使用技術
- フロントエンド：Nuxt.js
- バックエンド: Ruby on Rails(api), rspec, rubocop
- インフラ: AWSを予定

## 現状
- 本番環境に関してはECSでのデプロイを予定しております。

# ③補足
## データベース
作成中
## インフラ構成図
![AWS (2019年) フレームワーク](https://user-images.githubusercontent.com/64460231/104606977-ad3d0180-56c3-11eb-81f5-b820def59af3.png)
