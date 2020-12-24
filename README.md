# テーブル設計

## users テーブル

| Column             | Type   | Options          |
| --------           | ------ | -----------      |
| nickname           | string | null: false      |
| email              | string | null: false      |
| password           | string | null: false      |
| encrypted_password | string | null: false      |
| family_name        | string | null: false      |
| first_name         | string | null: false      |
| family_name_kana   | string | null: false      |
| first_name_kana    | string | null: false      |
| birth_year         | date   | null: false      |
| birth_month        | date   | null: false      |
| birth_day          | date   | null: false      |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column              | Type    | Options             |
| --------            | ------  | -----------         |
| title               | string  | null: false         |
| description         | text    | null: false         |
| category            | text    | Active_Hashで実装    |
| condition_id        | integer | Active_Hashで実装    |
| postage_id          | integer | Active_Hashで実装    |
| shipper_address_id  | integer | Active_Hashで実装    |
| preparation_days_id | integer | Active_Hashで実装    |
| price               | integer | null: false         |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column  | Type       | Options                        |
| --------| ------     | -----------                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destination テーブル

| Column       | Type       | Options                        |
| --------     | ------     | -----------                    |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | Active_Hashで実装               |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| buyer_id     | references | null: false, foreign_key: true |


### Association

- belongs_to :buyer
