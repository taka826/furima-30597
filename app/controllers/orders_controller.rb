class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def new
    @user_item = UserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(item_params)
      if @user_item.valid?
        pay_item
        @user_item.save
        redirect_to action: :index
      else
        render action: :index
      end
  end

  private

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