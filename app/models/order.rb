class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer

  def subtotal
    item.tax_price * amount
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, making: 2, preparing_to_ship: 3, shipped: 4 }

end
