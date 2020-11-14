# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| kana_first_name    | string  | null: false |
| kana_last_name     | string  | null: false |
| birthday           | date    | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ------------|
| name             | string   | null: false |
| explanation      | text     | null: false |
| categories_id    | integer  | null: false |
| condition_id     | integer  | null: false |
| fee_type_id      | integer  | null: false |
| delivery_area_id | integer  | null: false |
| delivery_days_id | integer  | null: false |
| price            | integer  | null: false |
| user_id          | integer  | null: false |

### association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ------------|
| item_id         | integer  | null: false |
| user_id         | integer  | null: false |

### association

- belongs_to :user
- belongs_to :item
- has_one :buyer_address


## buyer_address テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ------------|
| postal_code      | string   | null: false |
| prefecture_id    | integer  | null: false |
| city             | string   | null: false |
| house_number     | string   | null: false |
| building_name    | string   | null: false |
| tel              | string   | null: false |
| purchase_id      | integer  | null: false |


### association

- belongs_to :purchase