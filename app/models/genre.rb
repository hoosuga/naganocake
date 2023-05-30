class Genre < ApplicationRecord
  has_many :items

  def genre_display
    name
  end
end
