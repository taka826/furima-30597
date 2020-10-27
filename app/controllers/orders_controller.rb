class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @user = user.new
  end

  def create
    @user = User.create(order_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def order_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :first_name, :last_name, :first_kana, :last_kana, :birthday)
  end
  
  def item_params
    params.require(:item).permit(:content, :image, :name, :description, :category_id, :condition_id, :cost_id, :area_id, :day_id, :price, :user).merge(user_id: current_user.id)
  end
end