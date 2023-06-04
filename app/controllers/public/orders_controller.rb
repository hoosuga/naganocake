class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items
    @sum = 0
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    else params[:order][:select_address] == "1"
      @address = Delivery.find(params[:order][:deliveries_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    #@order.name = current_customer.first_name + current_customer.last_name

  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address)
  end

end
