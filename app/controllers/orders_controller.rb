class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
  
  def move_to_index
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif user_signed_in? && current_user.id != @item.user_id && @item.order != nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end