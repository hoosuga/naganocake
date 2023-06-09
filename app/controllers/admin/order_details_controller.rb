class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(order_status: 2) if @order_detail.crafting_status == "making"

      @order_details.each do |order_detail|
        if order_detail.crafting_status != "completed"
          is_updated = false
        end
      end
      @order.update(order_status: 3) if is_updated
    end
    redirect_to admin_orders_show_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:crafting_status)
  end

end
