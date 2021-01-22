class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create, :move_to_index]

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
    if @purchase.valid?
      # pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:purchase).permit(:postal_code, :city, :house_number, :building, :phone_number, :prefecture_id, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  # , token: params[:token]
  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: @item.price,
  #     card: order_params[:token],
  #     currency:'jpy'
  #   )
  # end
  

  def set_item
    @item = Item.find(params[:item_id])
  end

end