class User < ApplicationRecord
    has_many :reservations, class_name: "reservation"
    validates :name, presence: true
end
