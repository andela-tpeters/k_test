class Airfare < ApplicationRecord
  belongs_to :class, class_name: "TravelClass"
  belongs_to :route,
  has_many :payments
end
