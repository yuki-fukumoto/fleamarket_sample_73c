# table_setting

## users

### table

| column         | type   | option                     |
| -------------- | ------ | -------------------------- |
| nickname       | string | null: false                |
| email          | string | null: false, uniquer: true |
| password       | string | null: false                |
| firstname      | string | null: false                |
| lastname       | string | null: false                |
| firstname_read | string | null: false                |
| lastname_read  | string | null: false                |
| birthday       | date   | null: false                |

### association

- has_many :addresses, dependent: :destroy
- has_many :creditcards, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :item_purchases, dependent: :destroy

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
- has_many :item_purchases

## creditcards

### table

| column           | type       | option                                  |
| ---------------- | ---------- | --------------------------------------- |
| custamer_id      | string     | null: false                             |
| card_id          | string     | null: false                             |
| user_id          | integer    | null: false, foreign_key: true          |

### association

- belongs_to :user
- has_many :item_purchases

## items

### table

| column              | type    | option                         |
| ------------------- | ------- | ------------------------------ |
| name                | string  | null: false                    |
| explanation         | text    | null: false                    |
| price               | integer | null: false                    |
| shipping_fee        | integer | null: false                    |
| user_id             | integer | null: false, foreign_key: true |
| condition_id        | integer | null: false, foreign_key: true |
| category_id         | integer | null: false, foreign_key: true |
| brand_id            | integer | foreign_key: true              |
| item_purchase_id    | integer | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :item_purchase
- belongs_to :condition
- belongs_to :category
- belongs_to :brand_id
- has_many :images, dependent: :destroy

## images

### table

| column  | type    | option                         |
| ------- | ------- | ------------------------------ |
| image   | string  | null :false                    |
| item_id | integer | null: false, foreign_key: true |

### association

- belongs_to :item

## conditions

### table

| column    | type   | option                     |
| --------- | ------ | -------------------------- |
| condition | string | null: false, uniquer: true |

### association

- has_many :items

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

| column   | type   | option      |
| -------- | ------ | ----------- |
| name     | string |             |
### association

- has_many :items

## item_purchases

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

![fleamarket_sample_73c (4)](https://user-images.githubusercontent.com/64318733/85542287-e3496400-b653-11ea-8993-9ce79086ea54.jpg)