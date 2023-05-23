class Admin::ItemsController < ApplicationController
  has_one_attached :image

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params)
    @item.save
    redirect_to admin_item_show_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :sale_status)
  end

end
