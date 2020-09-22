# DB設計

## Postsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|text|string|null: false|

### Association

- belongs_to :user
- has_many :evidences dependent: :destroy

## Evidencesテーブル

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

### Association

- belongs_to :post

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|image|string||

### Association

- has_one :sns_credential dependent: :destroy
- has_many :posts dependent: destroy

## SNS_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|uid|string||

### Association

- belongs_to :user optional: true
