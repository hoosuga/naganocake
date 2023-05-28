class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_detail
  has_many :cart_item

  def tax_price
    (price * 1.1).floor
  end
end
