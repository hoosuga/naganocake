class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(12)
    @genres = Genre.all
  end

  def show
  end

end
