class Car < ApplicationRecord
    has_many :reservations, class_name: "reservation"
end
