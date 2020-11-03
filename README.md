# アプリ名：Evi Source(えびそーす)

## アプリ概要

Twitter特化型の簡易エビデンス提示アプリです。
Twitter上のデマ・真偽不明な情報に対し、Evi SourceのURLのリンクを載せて発言することで情報の参照元を提示することができ、信頼性の薄い情報による風評被害やインフォデミックを未然に防ぐことができます。

## 製作意図

Twitterやその他SNS等では偽・誤情報が広まることも多く、コロナウイルスに効くという噂だけで特定の商品の買い占めが起こったり、有名人の偽アカウントに数万人のフォロワーがついたりしています。
それを承知で楽しんでいるユーザーもいますが、真偽不明な情報に巻き込まれ実害を被っている方々も実在します。
このアプリ内で使われている情報源の確認手法が広まることで、より多くの人が自然に情報を正しく理解し、活用できるようになればいいなと思い制作しました。

## 工夫した点

* ターゲットを「Twitterを既に使用していて、Evi Sourceを使用したことがないユーザー」に絞り設計しました

* Evi Sourceを初めて認知した人がアプリを使用し、完了するまでが10分以内に収まるよう導線の予測・機能の絞り込みに重点をおいています

* このアプリから直接Twitterにツイートを投稿できるようにしました(未実装)

* 横幅はモバイル版準拠のため、PCでもスマホでも同様に使用できます(一部フォーム崩れ有り)

## トップページ(兼エビデンス入力フォーム)イメージ画像

<img width="774" alt="EviSource" src="https://user-images.githubusercontent.com/55307855/93936221-c6aaee00-fd60-11ea-984e-e03c0f3ebb0b.png">

## 開発環境

Ruby 2.5.1
Rails 5.2.4
html/css(それぞれhaml/scssを使用)
JavaScript(jQuery)
RSpec(テスト環境)
MySQL(データベース)
TwitterAPI(未実装)

## 今後実装したい機能

* ユーザーサインイン機能

* エビデンスの編集機能

## DB設計

### Postsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|text|text|null: false|

#### Association

- belongs_to :user
- has_many :evidences dependent: :destroy

### Evidencesテーブル

|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
|source|string|null: false|
|informant|string||
|source_updated_on|date||
|level|integer|default: null, limit:1|
|fact_or_opinion|integer|default: null, limit:1|
|data_type|integer|default: null, limit:1|
|reference|text||

#### Association

- belongs_to :post

### Usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|image|string||

#### Association

- has_one :sns_credential dependent: :destroy
- has_many :posts dependent: destroy

### SNS_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|uid|string||

#### Association

- belongs_to :user optional: true
