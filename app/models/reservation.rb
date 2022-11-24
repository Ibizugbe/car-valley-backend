class Reservation < ApplicationRecord
  belongs_to :car, class_name: 'Car'
  belongs_to :user, class_name: 'User'
  validates :date, presence: true
  validates :city, presence: true
end
