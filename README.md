# table_setting

## ER diagram

![ER diagram](https://user-images.githubusercontent.com/62494531/90950463-971c7380-e48c-11ea-8748-a9d4378d3387.png)

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
- has_many :comments

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
| shipping_pay    | integer | null: false, default: 0        |
| shipping_area   | integer | null: false, default: 0        |
| shipping_period | integer | null: false, default: 0        |
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
- has_many :comments

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

## comments

### table

| name    | type    | option                         |
| ------- | ------- | ------------------------------ |
| text    | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :item

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
