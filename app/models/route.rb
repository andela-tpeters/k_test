class Route < ApplicationRecord
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"
  has_many :flights
end
