## users

|Column             |Type    |Options     |
|-------------------|--------|------------|
|nickname           |string  |null: false |
|email              |string  |null: false |
|encrypted_password |string  |null: false |
|first_name         |string  |null: false |
|last_name          |string  |null: false |
|first_kana         |string  |null: false |
|last_kana          |string  |null: false |
|birthday           |date    |null: false |


### Association
has_many :items
has_many :orders

## items

|Column             |Type          |Options                       |
|-------------------|--------------|------------------------------|
|name               |string        |null: false                   |
|description        |text          |null: false                   |
|category_id        |integer       |null: false                   |
|condition_id       |integer       |null: false                   |
|cost_id            |integer       |null: false                   |
|area_id            |integer       |null: false                   |
|days_id            |integer       |null: false                   |
|price              |integer       |null: false                   |
|user               |references    |foreign_key: true, null: false|


### Association
belongs_to :user
has_one :order

## orders

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
|area_id         |integer   |null: false                   |
|city            |string    |null: false                   |
|house_number    |string    |null: false                   |
|phone           |string    |null: false                   |
|build_name      |string    |                              |
|order           |references|foreign_key: true, null: false|


### Association
belongs_to :order