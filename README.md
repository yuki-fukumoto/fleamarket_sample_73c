# table_setting

## user

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
- has_many :transactions, dependent: :destroy

## address

### table

| column         | type    | option            |
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

| column           | type       | option                     |
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

| column            | type    | option            |
| ----------------- | ------- | ----------------- |
| name              | string  | null: false       |
| explanation       | text    | null: false       |
| price             | integer | null: false       |
| shipping_fee      | integer | null: false       |
| brand             | string  |                   |
| user_id           | integer | foreign_key: true |
| condition_id      | integer | foreign_key: true |
| category_id       | integer | foreign_key: true |
| transaction_id    | integer | foreign_key: true |

### association

- belongs_to :user
- belongs_to :transaction
- belongs_to :condition
- belongs_to :category
- has_many :images, dependent: :destroy

## image

### table

| column  | type    | option            |
| ------- | ------- | ----------------- |
| image   | string  | null :false       |
| item_id | integer | foreign_key: true |

### association

- belongs_to :item

## condition

### table

| column    | type   | option                     |
| --------- | ------ | -------------------------- |
| condition | string | null: false, uniquer: true |

### association

- has_many :items

## category

### table

| column   | type   | option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |
### association

- has_many :items

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

https://user-images.githubusercontent.com/62494531/85397499-9780b700-b58e-11ea-9182-87e474e64ae3.jpg