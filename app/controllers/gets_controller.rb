class GetsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_get_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]

  def index
    @get_address = GetAddress.new
  end

  def create
    @get_address = GetAddress.new(get_params)
    if @get_address.valid?
      pay_item
      @get_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def get_params
    params.require(:get_address).permit(:postal_code, :prefecture_id, :city, :address_name, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: get_params[:token],
      currency: 'jpy'  
    )
  end

  def move_to_root
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_item
    if Get.exists?(@item.id)
      redirect_to root_path
    end
  end

  def set_get_item
    @item = Item.find(params[:item_id])
  end

end

