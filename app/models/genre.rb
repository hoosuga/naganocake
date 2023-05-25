class Genre < ApplicationRecord
  has_many :items, dependent: :destroy

  def genre_display
    name
  end
end
