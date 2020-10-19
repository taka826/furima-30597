## users

|Column             |Type    |Options     |
|-------------------|--------|------------|
|nickname           |string  |null: false |
|email              |string  |null: false |
|encrypted_password |string  |null: false |
|first_name         |string  |null: false |
|last_name          |string  |null: false |
|first_lana         |string  |null: false |
|last_kana          |string  |null: false |
|birthday           |date    |null: false |


### Association
has_many :items
has_many :purchase_histories

## items

|Column             |Type          |Options                       |
|-------------------|--------------|------------------------------|
|product_name       |string        |null: false                   |
|product_description|text          |null: false                   |
|category_id        |integer       |null: false                   |
|condition_id       |integer       |null: false                   |
|cost_id            |integer       |null: false                   |
|area_id            |integer       |null: false                   |
|days_id            |integer       |null: false                   |
|price              |integer       |null: false                   |
|user               |references    |foreign_key: true, null: false|


### Association
belongs_to :user
has_one :purchase_history

## purchase_history

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|user          |references |foreign_key: true, null: false|
|item          |references |foreign_key: true, null: false|


### Association
belongs_to :item
belongs_to :user
has_one :address


## addresses

|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|postal_code     |string    |null: false                   |
|prefecture_id   |integer   |null: false                   |
|municipality    |string    |null: false                   |
|address         |string    |null: false                   |
|phone           |string    |null: false                   |
|build_name      |string    |                              |
|purchase_history|references|foreign_key: true, null: false|


### Association
belongs_to :purchase_history