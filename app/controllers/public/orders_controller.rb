class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :destination_name, :address)
  end

end
