class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end

  def new
  end

  def create
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
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end