class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end
  

  private
  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
