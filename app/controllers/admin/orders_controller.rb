class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @customer = @order.customer
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(crafting_status: 1) if @order.order_status == "payment_confirmation"
    end
    redirect_to admin_orders_show_path(@order.id)

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:crafting_status)
  end

end
