# table_setting

## ER diagram

![ER diagram](https://user-images.githubusercontent.com/62494531/85916203-4c65ed00-b889-11ea-9436-a83aa16e07ae.jpg)

## users

### table

| column         | type   | option                    |
| -------------- | ------ | ------------------------- |
| nickname       | string | null: false               |
| email          | string | null: false, unique: true |
| password       | string | null: false               |
| firstname      | string | null: false               |
| lastname       | string | null: false               |
| firstname_read | string | null: false               |
| lastname_read  | string | null: false               |
| birthday       | date   | null: false               |

### association

- has_many :addresses, dependent: :destroy
- has_many :creditcards, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :purchases, dependent: :destroy
- has_many :browsing_histories, dependent: :destroy

## addresses

### table

| column         | type    | option                         |
| -------------- | ------- | ------------------------------ |
| firstname      | string  | null: false                    |
| lastname       | string  | null: false                    |
| firstname_read | string  | null: false                    |
| lastname_read  | string  | null: false                    |
| zip            | integer | null: false                    |
| prefecture     | string  | null: false                    |
| city           | string  | null: false                    |
| address_line   | string  | null: false                    |
| building       | string  |                                |
| room           | string  |                                |
| telephone      | integer |                                |
| user_id        | integer | null: false, foreign_key: true |

### association

- belongs_to :user
- has_many :purchases

## creditcards

### table

| column      | type    | option                         |
| ----------- | ------- | ------------------------------ |
| customer_id | string  | null: false                    |
| card_id     | string  | null: false                    |
| user_id     | integer | null: false, foreign_key: true |

### association

- belongs_to :user
- has_many :purchases

## items

### table

| column          | type    | option                         |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false                    |
| explanation     | text    | null: false                    |
| price           | integer | null: false                    |
| shipping_fee    | integer | null: false                    | -> delete |
| shipping_pay    | integer | null: false, default: 0        | -> add |
| shipping_area   | integer | null: false, default: 0        | -> add |
| shipping_period | integer | null: false, default: 0        | -> add |
| condition       | integer | null: false, default: 0        |
| image           | string  | null: false                    |
| status          | string  | null: false, default: 0        |
| user_id         | integer | null: false, foreign_key: true |
| category_id     | integer | null: false, foreign_key: true |
| brand_id        | integer | foreign_key: true              |
| purchase_id     | integer | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :purchase
- belongs_to :category
- belongs_to :brand
- has_many :images, dependent: :destroy
- has_many :browsing_histories, dependent: :destroy

## images

### table

| column  | type    | option                         |
| ------- | ------- | ------------------------------ |
| image   | string  | null :false                    |
| item_id | integer | null: false, foreign_key: true |

### association

- belongs_to :item

## categories

### table

| column   | type   | option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### association

- has_many :items

## brands

### table

| column | type   | option      |
| ------ | ------ | ----------- |
| name   | string | null: false |

### association

- has_many :items

## purchases

### table

| name          | type    | option                         |
| ------------- | ------- | ------------------------------ |
| item_id       | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |
| address_id    | integer | null: false, foreign_key: true |
| creditcard_id | integer | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :item
- belongs_to :address
- belongs_to :creditcard

## browsing_histories

### table

| name          | type    | option      |
| ------------- | ------- | ----------- |
| item_id       | integer | null: false |
| user_id       | integer | null: false |

### association

- belongs_to :user
- belongs_to :item
