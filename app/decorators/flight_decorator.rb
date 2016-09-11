class FlightDecorator < Draper::Decorator
  delegate_all

  def departure_date_range
    (Date.today..latest_flight_date.departure_date)
  end

  def latest_flight_date
    object.order(:departure_date).last
  end
end
