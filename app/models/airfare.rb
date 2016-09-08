class Airfare < ApplicationRecord
  belongs_to :travel_class
  has_many :flights
  has_many :payments
end
