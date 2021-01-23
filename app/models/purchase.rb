class Purchase
  
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :house_number, :building, :phone_number, :prefecture_id, :item_id, :user_id, :token


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, length: { minimum: 10 }, numericality: { only_integer: true, with: /\A\d{11}\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, building: building, prefecture_id: prefecture_id, phone_number: phone_number, order_id: order.id)
  end

end