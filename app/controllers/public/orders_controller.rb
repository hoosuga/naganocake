class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Delivery.find(params[:order][:deliveries_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:select_address] == "2"
    end

    @sum = 0
    @order.postage = 800
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item_id
      @order_details.price = cart_item.subtotal
      @order_details.amount = cart_item.amount
      @order_details.save
    end
    @cart_items.destroy_all
    redirect_to order_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
    @sum = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address, :invoice_amount, :customer_id, :postage)
  end

end
