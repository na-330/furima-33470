class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :product_status
  belongs_to :scheduled_delivery

  validates :category_id,:delivery_fee_id,:prefecture_id,:product_status_id,:scheduled_delivery_id, numericality: { other_than: 1 } 
end
