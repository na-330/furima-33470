class ItemsController < ApplicationController
  def index
  end

  def new
    @items  = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:info,:category_id,:delivery_fee_id,:prefecture_id,:product_status_id,:scheduled_delivery_id, :numericality, :price)
  end
end
