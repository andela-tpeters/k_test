class Airfare < ApplicationRecord
  belongs_to :route
  belongs_to :travel_class
  has_many :flights
  has_many :transactions
end
