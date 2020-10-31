class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if @item.order != nil
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    else
      @user_item = UserItem.new
    end
  end

  def new
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(item_params)
      if @user_item.valid?
        pay_item
        @user_item.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_params
    params.require(:user_item).permit(:postal_code, :area_id, :city, :house_number, :phone, :build_name, :order_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price], 
      card: item_params[:token], 
      currency: 'jpy' 
    )
  end
end