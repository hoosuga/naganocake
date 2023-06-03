class Public::HomesController < ApplicationController
  def home
    @genres = Genre.all
    @items = Item.all
  end
end
