# テーブル設計

## users テーブル

| Column           | Type   | Options          |
| --------         | ------ | -----------      |
| nickname         | string | null: false      |
| email            | string | null: false      |
| password         | string | null: false      |
| family_name      | string | null: false      |
| first_name       | string | null: false      |
| family_name_kana | string | null: false      |
| first_name_kana  | string | null: false      |
| birth_year       |        | Active_Hashで実装 |
| birth_month      |        | Active_Hashで実装 |
| birth_day        |        | Active_Hashで実装 |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column           | Type   | Options             |
| --------         | ------ | -----------         |
| image            |        | Active_Storageで実装 |
| title            | string | null: false         |
| description      | text   | null: false         |
| category         | text   | Active_Hashで実装    |
| condition        |        | Active_Hashで実装    |
| postage          |        | Active_Hashで実装    |
| shipper_address  |        | Active_Hashで実装    |
| preparation_days |        | Active_Hashで実装    |
| price            |        | Active_Hashで実装    |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column  | Type       | Options                        |
| --------| ------     | -----------                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_one :destination

## destination テーブル

| Column       | Type    | Options          |
| --------     | ------  | -----------      |
| postal_code  | integer | null: false      |
| prefecture   |         | Active_Hashで実装 |
| city         | string  | null: false      |
| house_number | string  | null: false      |
| building     | string  |                  |
| phone_number | integer | null: false      |


### Association

- belongs_to :buyer
