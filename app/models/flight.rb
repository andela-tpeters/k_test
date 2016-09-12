class Flight < ApplicationRecord
  belongs_to :aircraft
  belongs_to :route
  has_many :bookings
  has_many :payments
  accepts_nested_attributes_for :route

  def self.search(params)
    if params.blank?
      search_by_current
    else
      search_by_params(params)
    end
  end

  def self.search_by_current
    include_flight.where("departure_date > ?", Time.now)
  end

  def self.search_by_params(search_params)
    include_flight.
        where(search_params).
        where("departure_date > ?", Time.now)
  end

  def self.recent
    order(:departure_date).first(8)
  end

  def self.departure_order_asc
    order(:departure_date).pluck(:departure_date).uniq
  end

  def self.last
    order(:departure_date).last
  end

  def self.include_flight
    all.includes(
      route: [:departure_airport, :arrival_airport, airfares: [:travel_class]]
    )
  end
end
