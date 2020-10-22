class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def update
  end

  def destroy
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:content, :image, :name, :description, :category_id, :condition_id, :cost_id, :area_id, :days_id, :price, :user).merge(user_id: current_user.id)
  end
end