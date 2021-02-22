# README

## users

| column                 | type          | option                    |
| ---------------------- | ------------- | ------------------------- |
| nickname               | string        | null: false               |
| email                  | string        | null: false, unique: true |
| encrypted_password     | string        | null: false               |
| family_name            | string        | null: false               |
| first_name             | string        | null: false               |
| family_name_kana       | string        | null: false               |
| first_name_kana        | string        | null: false               |
| birthday               | date          | null: false               |

### association 
- has_many :items
- has_many :gets

## items

| column                 | type          | option            |
| ---------------------- | ------------- | ----------------- |
| name                   | string        | null: false       |
| content                | text          | null: false       |
| category_id            | integer       | null: false       | 
| condition_id           | integer       | null: false       |
| delivery_fee           | integer       | null: false       |
| prefecture_id          | integer       | null: false       |
| days_to_ship_id        | integer       | null: false       |
| price                  | integer       | null: false       |
| user                   | references    | foreign_key: true |

### association

- belongs_to :user
- has_one :get

<!-- ActiveHashの使用↑↑↑ -->

## addresses

| column                 | type          | option            |
| ---------------------- | ------------- | ----------------- |
| postal_code            | string        | null: false       |
| prefecture_id          | integer       | null: false       |
| city                   | string        | null: false       |
| address_name           | string        | null: false       |
| building_name          | string        |                   |
| phone_number           | string        | null: false       |
| get                    | references    | foreign_key: true |

### association

- belongs_to :get

## gets

| column                 | type          | option            |
| ---------------------- | ------------- | ----------------- |
| user                   | references    | foreign_key: true |
| item                   | references    | foreign_key: true |


### association

- belongs_to :user
- belongs_to :item
- has_one :address
