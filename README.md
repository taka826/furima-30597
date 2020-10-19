## users

|Column             |Type   |Options     |
|-------------------|-------|------------|
|nickname           |string |null: false |
|email              |string |null: false |
|encrypted_password |string |null: false |
|first_name         |string |null: false |
|last_name          |string |null: false |
|first_lana         |string |null: false |
|last_kana          |string |null: false |
|birthday           |integer|null: false |


### Association
has_many :items
has_many :purchase_history

## items

|Column             |Type          |Options          |
|-------------------|--------------|-----------------|
|product_name       |string        |null: false      |
|product_image      |ActiveStorage |null: false      |
|product_description|text          |null: false      |
|category           |string        |null: false      |
|product_condition  |string        |null: false      |
|shipping_cost      |string        |null: false      |
|shipping_area      |string        |null: false      |
|shipping_days      |datetime      |null: false      |
|price              |integer       |null: false      |
|seller             |string        |null: false      |
|user_id            |references    |foreign_key: true|


### Association
belongs_to :users
has_one :purchase_history

## purchase_history

|Column        |Type       |Options          |
|--------------|-----------|-----------------|
|buyer         |string     |null: false      |
|purchase_data |datetime   |null: false      |
|purchase      |string     |null: false      |
|user_id       |references |foreign_key: true|


### Association
belongs_to :items
belongs_to :users
has_one :addresses


## addresses

|Column       |Type    |Options          |
|-------------|--------|-----------------|
|postal_code  |integer |null: false      |
|prefecture   |string  |null: false      |
|municipality |string  |null: false      |
|address      |string  |null: false      |
|phone        |integer |null: false      |

### Association
belongs_to :purchase_history