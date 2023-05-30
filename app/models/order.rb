class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer

  def subtotal
    item.tax_price * amount
  end

end
