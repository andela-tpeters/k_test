class Flight < ApplicationRecord
  belongs_to :aircraft
  belongs_to :airfare
  belongs_to :route
  has_many :bookings
  has_many :transactions
end
