class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
 
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :product_status
  belongs_to_active_hash :scheduled_delivery

  validates :category_id, :delivery_fee_id, :prefecture_id, :product_status_id, :scheduled_delivery_id, numericality: { other_than: 1 } 
end
