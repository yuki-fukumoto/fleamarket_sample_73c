# table_setting

## user

### table

| name           | type   | option                     |
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
- has_many :transactions, dependent: :destroy

## address

### table

| name           | type    | option            |
| -------------- | ------- | ----------------- |
| firstname      | string  | null: false       |
| lastname       | string  | null: false       |
| firstname_read | string  | null: false       |
| lastname_read  | string  | null: false       |
| zip            | integer | null: false       |
| prefecture     | string  | null: false       |
| city           | string  | null: false       |
| address_line   | string  | null: false       |
| building       | string  |                   |
| room           | string  |                   |
| telephone      | integer |                   |
| user_id        | integer | foreign_key: true |

### association

- belongs_to :user
- has_many :transactions

## creditcard

### table

| name             | type       | option                     |
| ---------------- | ---------- | -------------------------- |
| cardholder       | string     | null: false                |
| card_number      | integer    | null: false, uniquer: true |
| expiration_year  | integer    | null: false                |
| expiration_month | integer    | null: false                |
| security_code    | integer    | null: false                |
| pin_code         | references | foreign_key: true          |
| user_id          | integer    | foreign_key: true          |

### association

- belongs_to :user
- has_many :transactions

## item

### table

| name              | type    | option            |
| ----------------- | ------- | ----------------- |
| name              |         |                   |
| explanation       |         |                   |
| price             |         |                   |
| shipping_fee      |         |                   |
| brand             |         |                   |
| user_id           | integer | foreign_key: true |
| condition_id      | integer | foreign_key: true |
| category_id       | integer | foreign_key: true |
| subcategory_id    | integer | foreign_key: true |
| subsubcategory_id | integer | foreign_key: true |
| transaction_id    | integer | foreign_key: true |

### association

- belongs_to :user
- belongs_to :transaction
- belongs_to :condition
- belongs_to :category
- belongs_to :subcategory
- belongs_to :subsubcategory
- has_many :images, dependent: :destroy

## image

### table

| name    | type    | option            |
| ------- | ------- | ----------------- |
| image   |         |                   |
| item_id | integer | foreign_key: true |

### association

- belongs_to :item

## condition

### table

| name      | type   | option                     |
| --------- | ------ | -------------------------- |
| condition | string | null: false, uniquer: true |

### association

- has_many :items

## category

### table

| name | type | option |
| ---- | ---- | ------ |
| name |      |        |

### association

- has_many :items
- has_many :subcategories

## subcategory

### table

| name        | type    | option            |
| ----------- | ------- | ----------------- |
| name        |         |                   |
| category_id | integer | foreign_key: true |

### association

- has_many :items
- has_many :subsubcategories
- belongs_to :category

## subsubcategory

### table

| name           | type    | option            |
| -------------- | ------- | ----------------- |
| name           |         |                   |
| subcategory_id | integer | foreign_key: true |

### association

- has_many :items
- belongs_to :subcategory

## transaction

### table

| name          | type    | option            |
| ------------- | ------- | ----------------- |
| item_id       | integer | foreign_key: true |
| user_id       | integer | foreign_key: true |
| address_id    | integer | foreign_key: true |
| creditcard_id | integer | foreign_key: true |

### association

- belongs_to :user
- belongs_to :item
- belongs_to :address
- belongs_to :creditcard
