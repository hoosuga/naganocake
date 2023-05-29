class Public::CartItemsController < ApplicationController
 def index
  @cart_items = CartItem.all
  @sum = 0
 end

 def create
   @cart_items = CartItem.find_by(item_id: params[:cart_item][:item_id])
   @cart_item = CartItem.new(cart_item_params)
   if @cart_items
    new_amount = @cart_items.amount + @cart_item.amount
    @cart_items.update_attribute(:amount, new_amount)
   else
     @cart_item.save
   end
     redirect_to cart_items_path
 end

 def update
  @cart_items = current_customer.cart_items
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(cart_item_params)
  redirect_to cart_items_path
 end

 def destroy
  @cart_items = current_customer.cart_items
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to cart_items_path
 end

 def destroy_all
  @cart_items = current_customer.cart_items
  @cart_items.destroy_all
  redirect_to cart_items_path
 end

 private

 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount, :customer_id)
 end

end
