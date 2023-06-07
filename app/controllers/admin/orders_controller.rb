class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @customer = @order.customer
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_show_path(@order.id)

    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_orders_show_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
