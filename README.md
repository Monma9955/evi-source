# アプリ名：Evi Source(えびそーす)

## アプリ概要

SNSへ投稿した内容に対して投稿を裏付ける根拠を提示するアプリです。
Twitter上のデマ・真偽不明な情報に対し、Evi SourceのURLのリンクを載せて発言することで情報の参照元を提示することができ、信頼性の薄い情報による風評被害やインフォデミックを未然に防ぐことができます。

## 使用方法

1. トップページの「投稿内容」に元となる情報を記載
1. 「根拠・情報源」以下に投稿内容を裏付ける根拠を文章かURLで記載
1. エビデンスを投稿し、表示された詳細ページのURLをTwitter等で共有する(ツイートボタンも有)

※実装の確認用
/posts : 投稿内容の一覧画面。現在はURL入力でのみアクセス可能。ログイン機能の実装に伴い通常機能として合体予定です。

## 製作意図

Twitterやその他SNS等では偽・誤情報が広まることも多く、コロナウイルスに効くという噂だけで特定の商品の買い占めが起こったり、有名人の偽アカウントに数万人のフォロワーがついたりしています。
それを承知で楽しんでいるユーザーもいますが、真偽不明な情報に巻き込まれ実害を被っている方々も実在します。
このアプリ内で使われている情報源の確認手法が広まることで、より多くの人が自然に情報を正しく理解し、活用できるようになればいいなと思い制作しました。

## 工夫した点

* アプリを利用しやすくするためログインしなくても利用できるよう設計しました

* エビデンス入力フォームにはしっかりした情報源の分類が求められるため、デマの拡散目的での利用がしづらくなっています

* googleフォームのようにページを表示してからすぐに使えるよう、evidences#newページをrootページと定義しました

* 動的一対多フォームにより、投稿の重みを手軽に増やすことができるようにしました

* フォーム投稿前に確認メッセージを出すことで操作ミスによる投稿を防止しています

* エビデンスを多数投稿してもアコーディオンメニュー(jQuery)により詳細ページの見た目が見やすくなるよう工夫しました

* このアプリから直接Twitterにツイートを投稿できるようにしました

* 投稿された情報源がURLだった場合、自動で判断してURLを短縮化するようにしました(bitly APIを使用)

* ビューの繰り返し要素はeachメソッドを使わず部分テンプレートを使用し処理の遅延を低減させています

* 投稿一覧は１ボタンで昇順降順を入れ替えられるようにしています

## トップページ(兼エビデンス入力フォーム)イメージ画像

<img width="720" alt="EviSource" src="https://user-images.githubusercontent.com/55307855/107802930-4c2d4a00-6da5-11eb-9375-629db33d57bf.png">

## 開発環境

* Ruby 2.6.3
* Rails 5.2.4
* html/css(それぞれhaml/scssを使用)
* JavaScript(jQuery)
* RSpec(テスト)
* MySQL(開発/本番環境)
* GitHub(リポジトリ管理)
* AWS EC2(インフラ)
* Sider(コードレビューの自動化)
* bitly API(投稿したURLの短縮化)

## アプリ機能

* 動的１対多フォームによる投稿文・エビデンス(投稿内容に対しての根拠)投稿機能
* 投稿文+エビデンスの詳細表示機能
* 投稿一覧表示機能
* TwitterAPIを使用し投稿内容をTwitterへつぶやく機能

## 今後実装したい機能

* ユーザーサインイン機能

* エビデンスの編集機能

* 投稿内容(POST)に対して肯定・否定のエビデンスがつけられるようにする

* エビデンス数や内容から投稿の信頼度(重み)を判定する機能

* 投稿がどれだけ閲覧されているか表示する機能

## DB設計

### postsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|text|text|null: false|

#### Association

* belongs_to :user
* has_many :evidences dependent: :destroy

### evidencesテーブル

|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
|source|text|null: false|
|informant|string||
|source_updated_on|date||
|level|integer|default: null, limit:1|
|fact_or_opinion|integer|default: null, limit:1|
|data_type|integer|default: null, limit:1|
|reference|text||

#### Association

* belongs_to :post
* has_one :short_url dependent: :destroy

### short_urlsテーブル

|Column|Type|Options|
|------|----|-------|
|evidence|references|null: false, foreign_key: true|
|url|string|null: false|

#### Association

* belongs_to :evidence

### usersテーブル(未実装)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|image|string||

#### Association

* has_one :sns_credential dependent: :destroy
* has_many :posts dependent: destroy

### sns_credentialsテーブル(未実装)

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|uid|string||

#### Association

* belongs_to :user optional: true
