class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :flight
  has_many :passengers
  has_one :payment
end
