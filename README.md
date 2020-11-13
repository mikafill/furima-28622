# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ------------|
| nickname        | string  | null: false |
| e-mail          | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| kana_first_name | string  | null: false |
| kana_last_name  | string  | null: false |
| birthday        | date    | null: false |


### Association

- has_many :objects
- has_many :purchases


## objects テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ------------|
| picture         | text     | null: false |
| name            | string   | null: false |
| explanation     | text     | null: false |
| categories      | string   | null: false |
| shipping_term   | string   | null: false |
| price           | integer  | null: false |
| user_id         | integer  | null: false |

### association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ------------|
| credit_num      | integer  | null: false |
| address         | string   | null: false |
| tel             | integer  | null: false |
| object_id       | integer  | null: false |
| user_id         | integer  | null: false |

### association

-belongs_to :user
-belongs_to :objects