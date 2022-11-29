class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  validates :username, presence: true, uniqueness: true
  validates :password, :first_name, :last_name, :dob, presence: true
end
