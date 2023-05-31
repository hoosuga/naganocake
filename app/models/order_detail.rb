class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum crafting_status: { not_make: 0, waiting_to_make: 1, making: 2, completed: 3 }

end
