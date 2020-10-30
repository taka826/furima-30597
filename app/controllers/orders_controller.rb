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
    Payjp.api_key = "sk_test_b772efcca7769bbfe9ddd913"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: item_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end