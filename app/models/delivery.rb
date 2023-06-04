class Delivery < ApplicationRecord
  belongs_to :customer

  def deliveries_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
