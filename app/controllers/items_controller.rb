class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:content, :image, :name, :description, :category_id, :condition_id, :cost_id, :area_id, :day_id, :price, :user).merge(user_id: current_user.id)
  end
end