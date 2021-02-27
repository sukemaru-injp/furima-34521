class GetsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @get_address = GetAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @get_address = GetAddress.new(get_params)
    if @get_address.valid?
      @get_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def get_params
    params.require(:get_address).permit(:postal_code, :prefecture_id, :city, :address_name, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

