class Airport < ApplicationRecord
  belongs_to :state
  has_many :departure_routes, class_name: "Route", foreign_key: :departure_id
  has_many :arrival_routes, class_name: "Route", foreign_key: :arrival_id
end
