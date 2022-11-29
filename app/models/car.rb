class Car < ApplicationRecord
  has_many :reservations
  validates :model, :color, :description, :release_date, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
