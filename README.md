# ①アプリケーションについて
## URL
URL:  本番環境稼働に関しては、現在対応中

## 概要
- アプリケーション名:「PUSHAR」
- 内容：プログラミングに関するサイトのURLを共有するアプリケーションです。
- 作成理由：関連するキーワードから、興味のあるWebサイトのURLのみを簡単に検索・保存するアプリが欲しいと思い作成。<br>特に、『プログラミング学習において関連ページにどんどん進んで行ってしまうとGoogleタグの溜まりすぎで目的のページを見失ってしまうことがあったので、URLのみを共有できれば』の問題を**Programming + URL + Sharing**で解決することをコンセプトにしたアプリケーションです。<br><br>
![リロード機能](https://gyazo.com/3165bbeb00abf4c1a9634a6f3f424b27.gif)



# ②アプリケーションの詳細について
## 機能
- 新規登録機能(firebase-Authentication, 新規登録)<br><br>
![新規登録機能](https://gyazo.com/ad295d675060bbf4356320ec69a5c3df.gif)
- ログイン機能(firebase-Authentication, ログイン)<br><br>
![ログイン機能](https://gyazo.com/535fdcbc50e3b9710c17b7923c916609.gif)
- ログアウト機能(firebase-Authentication, ログアウト)<br><br>
![ログアウト機能](https://gyazo.com/528a8de7cc8e558a91f53e40f72241c6.gif)
- パスワード再設定(firebase-Authentication, 登録したメールアドレスにパスワード再設定用のurl発行出来ます)<br><br>
![パスワード再設定機能](https://gyazo.com/1bc73525b7caab26b293e53f16b7e63e.gif)<br><br>
- 発行されたurlです<br><br>
![パスワード再設定機能](https://gyazo.com/483432abf43617d9e2541a4a27d83e1c.png)<br><br>
- URL投稿機能(CRUD),modalによる投稿画面<br><br>
![URL投稿機能](https://gyazo.com/a76b109fef5e4b5e6d18139a6ba05188.gif)
- URL検索機能(Vueでのリアルタイム検索, URLに関する情報を検索出来ます)<br><br>
![URL検索機能](https://gyazo.com/745d770be5a26a9aa4bd50d69782b387.gif)
- マイページ(現在の投稿数とストック数が記載されています)<br><br>
![マイページ](https://gyazo.com/4949bd815546b223f31ad56df638bc12.gif)
- アバター, 画像保存機能(activestorage, ユーザー画像をアップロード出来ます)<br>
![アバター画像保存機能](https://gyazo.com/d945c09a2e5d2d24fd91298151656d2d.gif)
- プロフィール編集機能(ユーザーのプロフィールを編集が可能です)<br><br>
![プロフィール編集機能](https://gyazo.com/585c32b44dd14120077cf4fffe8f077e.gif)
- 自分の投稿へのピックアップ機能(自分投稿からイチオシを追加・削除出来ます)<br><br>
![ピックアップ機能](https://gyazo.com/1386c5bc3908526e7f89473393839275.gif)
- 投稿へのストック機能(他人の投稿を簡単に保存・削除可能です)<br><br>
![ストック機能](https://gyazo.com/df2a1b29a8c3c283f1d34f6981f3b190.gif)
- フォロー,フォロワー機能(ユーザー同士でフォロー・フォロー解除出来ます)<br><br>
![フォロー・フォロワー機能](https://gyazo.com/8a2d435b93842b6c4ad41fdf890729d7.gif)
- ヘルプページ<br><br>
![ヘルプページ](https://gyazo.com/441a04d0b09264c84d72120a97524a22.gif)
- 退会機能(ユーザー情報を削除出来ます)<br><br>
![退会機能](https://gyazo.com/c8e7bef32c8629d968a8d3897a768d8c.gif)

## 使用技術
- フロントエンド：Nuxt.js
- バックエンド: Ruby on Rails(api), rspec, rubocop
- インフラ: AWS(ECS)を予定

## 現状
- 本番環境に関してはECSでのデプロイを予定しております。

# ③補足
## データベース(テーブル設計)
## User テーブル

| Column           | Type   | Options                       |
| ---------------- | ------ | ----------------------------- |
| name             | string | null: false                   |
| email            | email  | null: false, uniqueness: true |
| uid              | string | null: false                   |
| profile          | text   | null: false                   |


### アソシエーション

- has_one_attached :avatar
- has_many :posts
- has_many :likes
- has_many :pickups
- has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship'
- has_many :followings, through: :following_relationships
- has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship'
- has_many :followers, through: :follower_relationships

## Post テーブル

| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| user           | references | null: false, foreign_key |
| title          | string     | null: false              |
| point          | text       | null: false              |

### アソシエーション

- belongs_to :user
- has_many :links
- has_many :likes
- has_many :pickups

## Link テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | references | null: false, foreign_key: true |
| url           | string     |                                |
| og_title      | string     |                                |
| og_image      | text       |                                |
| og_description| string     |                                |
| og_url        | string     |                                |

### アソシエーション

- belongs_to :post


## Like テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key       |
| post          | references | null: false, foreign_key: true | 

### アソシエーション

- belongs_to :user
- belongs_to :post


## Pickup テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -----------------------------  |
| user          | references | null: false, foreign_key       |
| post          | references | null: false, foreign_key: true | 

### アソシエーション

- belongs_to :post
- belongs_to :user

## Relationship テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -----------------------------  |
| follower_id   | integer    | null: false, uniqueness: true  |
| following_id  | integer    | null: false, uniqueness: true  |

### アソシエーション

- belongs_to :follower, class_name: 'User'
- belongs_to :following, class_name: 'User'

## インフラ構成図
 ### ※作成予定

##  セールスポイント
- Frontend、Backendを切り分け、Dockerを利用して疎結合のシステムを実現。
- DockerComposeを用いて開発環境構築をしている。
- Frontendにて、Nuxt.jsを用いてSPAを実現。
- UIUX・デザインにこだわり、より少ない導線・心地よい使用感でのサービス提供の実現。
- レスポンシブデザインに対応している。
- 外部API（firebase）を用いて機能を実現している。
