class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :product_status
  belongs_to_active_hash :scheduled_delivery

  validates :category_id, :delivery_fee_id, :prefecture_id, :product_status_id, :scheduled_delivery_id,
            numericality: { other_than: 1 }

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :product_status_id
    validates :prefecture_id
    validates :delivery_fee_id
    validates :scheduled_delivery_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
end
