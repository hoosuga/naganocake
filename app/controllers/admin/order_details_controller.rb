class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.find(params[:id])
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:crafting_status)
  end

end
