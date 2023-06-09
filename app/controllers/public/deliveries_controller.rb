class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @delivery.customer_id = current_customer.id
    @deliveries = current_customer.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
    @delivery.customer_id = current_customer.id
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.customer_id = current_customer.id
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end


end
