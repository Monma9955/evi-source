# アプリ名：Evi Source(えびそーす)

## アプリ概要

SNSへ投稿した内容に対して投稿を裏付ける根拠を提示するアプリです。
Twitter上のデマ・真偽不明な情報に対し、Evi SourceのURLのリンクを載せて発言することで情報の参照元を提示することができ、信頼性の薄い情報による風評被害やインフォデミックを未然に防ぐことができます。

## 製作意図

Twitterやその他SNS等では偽・誤情報が広まることも多く、コロナウイルスに効くという噂だけで特定の商品の買い占めが起こったり、有名人の偽アカウントに数万人のフォロワーがついたりしています。
それを承知で楽しんでいるユーザーもいますが、真偽不明な情報に巻き込まれ実害を被っている方々も実在します。
このアプリ内で使われている情報源の確認手法が広まることで、より多くの人が自然に情報を正しく理解し、活用できるようになればいいなと思い制作しました。

## 工夫した点

* ターゲットを「Twitterを既に使用していて、Evi Sourceを使用したことがないユーザー」に絞り設計しました

* Evi Sourceを初めて認知した人がアプリを使用し、完了するまでが10分以内に収まるよう導線の予測・機能の絞り込みに重点をおいています

* このアプリから直接Twitterにツイートを投稿できるようにしました

* 横幅はモバイル版準拠のため、PCでもスマホでも同様に使用できます(一部フォーム崩れ有り)

## トップページ(兼エビデンス入力フォーム)イメージ画像

<img width="774" alt="EviSource" src="https://user-images.githubusercontent.com/55307855/93936221-c6aaee00-fd60-11ea-984e-e03c0f3ebb0b.png">

## 開発環境

* Ruby 2.5.1
* Rails 5.2.4
* html/css(それぞれhaml/scssを使用)
* JavaScript(jQuery)
* RSpec(テスト)
* MySQL(開発/本番環境)
* GitHub(リポジトリ管理)
* AWS EC2(インフラ)
* Sider(コードレビューの自動化)
* bitly AIP(投稿したURLの短縮化)

## 今後実装したい機能

* ユーザーサインイン機能

* エビデンスの編集機能

* CIツールの導入

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
