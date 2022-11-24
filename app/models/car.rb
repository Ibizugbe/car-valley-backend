class Car < ApplicationRecord
  has_many :reservations, class_name: 'reservation'
  validates :model, presence: true
  validates :color, presence: true
  validates :description, presence: true
  validates :release_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
