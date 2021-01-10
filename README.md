# テーブル設計

## users テーブル

| Column             | Type   | Options          |
| --------           | ------ | -----------      |
| nickname           | string | null: false      |
| email              | string | null: false      |
| encrypted_password | string | null: false      |
| family_name        | string | null: false      |
| first_name         | string | null: false      |
| family_name_kana   | string | null: false      |
| first_name_kana    | string | null: false      |
| date_of_birth      | date   | null: false      |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column              | Type       | Options                        |
| --------            | ------     | -----------                    |
| title               | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| postage_id          | integer    | null: false                    |
| address_id          | integer    | null: false                    |
| preparation_day_id  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buyer

## order テーブル

| Column  | Type       | Options                        |
| --------| ------     | -----------                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destination テーブル

| Column                | Type       | Options                        |
| --------              | ------     | -----------                    |
| postal_code           | string     | null: false                    |
| address_id            | integer    | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building              | string     |                                |
| phone_number          | string     | null: false                    |
| order                 | references | null: false, foreign_key: true |


### Association

- belongs_to :buyer
