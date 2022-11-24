class User < ApplicationRecord
  has_many :reservations, class_name: 'reservation'
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true

end
