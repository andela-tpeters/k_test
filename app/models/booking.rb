class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  has_one :payment
  before_create :set_booking_ref
  accepts_nested_attributes_for :passengers,
                                reject_if: :all_blank,
                                allow_destroy: true

  def set_booking_ref
    self.booking_ref = SecureRandom.hex(4).upcase
  end

  def departure
    flight.route.departure_airport.city
  end

  def arrival
    flight.route.arrival_airport.city
  end
end
