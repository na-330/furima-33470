class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    move_to_index(@item)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :delivery_fee_id, :prefecture_id, :product_status_id,
                                 :scheduled_delivery_id, :numericality, :price).merge(user_id: current_user.id)
  end

  def move_to_index(item)
    unless current_user.id == item.user.id
      redirect_to root_path
    end
  end

end
