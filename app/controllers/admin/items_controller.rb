class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_show_path(@item.id)
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_show_path(@item.id)
  end

  def search
    @items = Item.all
    @items = @items.where('name LIKE ?', "%#{params[:search]}%") if params[:seach].present?
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :sale_status, :image, :genre_id)
  end

end
