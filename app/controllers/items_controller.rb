class ItemsController < ApplicationController

  def index
    @imtes = Item.all
  end
  
end
