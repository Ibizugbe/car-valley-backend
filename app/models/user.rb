class User < ApplicationRecord
  has_secure_password
  has_many :reservations, class_name: 'reservation'
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
end
