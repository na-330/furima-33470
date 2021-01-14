## Users(ユーザー)テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname   | string | null: false, foreign_key: true |
| email  | string | null: false, foreign_key: true |
| password  | string | null: false, foreign_key: true |
| first_name  | string | null: false, foreign_key: true |
| last_name  | string | null: false, foreign_key: true |
| birth_date  | date | null: false, foreign_key: true |

### Association
- has_many :products
- has_many :purchases

## Products(商品)テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string | null: false, foreign_key: true |
| name  | string | null: false, foreign_key: true |
| info  | string | null: false, foreign_key: true |
| category  | integer | null: false, foreign_key: true |
| product_status  | string | null: false, foreign_key: true |
| prefecture | date | null: false, foreign_key: true |
| delivery_fee  | date | null: false, foreign_key: true |
| scheduled_delivery  | date | null: false, foreign_key: true |
| price  | date | null: false, foreign_key: true |
| user_id  | date | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item_purchase
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :product_status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery
- belongs_to :seller, class_name: "User"

## product_purchases(購入) テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| product       | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |
| purchase_info | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :purchase_info


## comments(コメント) テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | integer    | null: false, foreign_key: true |
| product | integer    | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## purchase_info(購入者) テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item_purchase | integer    | null: false, foreign_key: true |

### Association

- has_one_active_hash :prefectures
- has_one :item_purchase