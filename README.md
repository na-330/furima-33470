## Users(ユーザー)テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname   | string | null: false |
| email  | string | null: false |
| encrypted_password  | string | null: false |
| first_name_j  | string | null: false |
| last_name_j  | string | null: false |
| first_name_k  | string | null: false |
| last_name_k  | string | null: false |
| birth_date  | date | null: false |

### Association
- has_many :products
- has_many :purchases
- has_many :comments

## Products(商品)テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name  | string | null: false |
| info  | text | null: false |
| category_id  | integer | null: false |
| product_status_id  | integer | null: false |
| prefecture_id | integer | null: false |
| delivery_fee_id  | integer | null: false |
| scheduled_delivery_id  | integer | null: false |
| price  | integer | null: false |
| user | references | null: false, foreign_key: true |

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
| product       | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :purchase_info


## comments(コメント) テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## purchase_info(購入者) テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code | string | null: false |
| prefectures_id | integer | null: false |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item_purchase | references | null: false, foreign_key: true |

### Association

- has_one_active_hash :prefectures
- belongs_to :item_purchase