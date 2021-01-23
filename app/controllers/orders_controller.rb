class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:purchase).permit(:postal_code, :city, :house_number, :building, :phone_number, :prefecture_id, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_e7f8fb15e5cd6e15f94e1a5e" # PAY.JPテスト秘密鍵
    binding.pry
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
  

  def set_item
    @item = Item.find(params[:item_id])
  end

end