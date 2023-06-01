class Delivery < ApplicationRecord
  has_many :customer

  def deliveries_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
