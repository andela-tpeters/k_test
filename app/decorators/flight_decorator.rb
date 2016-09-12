class FlightDecorator < Draper::Decorator
  delegate_all

  def by_day(date)
    object.where("departure_date between ? and ?", date.beginning_of_day, date.end_of_day)
  end

  def departure_date_range
    (Date.today..latest_flight_date.departure_date)
  end

  def latest_flight_date
    object.order(:departure_date).last
  end

  def uniq_departure_dates
    dates = object.order(:departure_date).pluck(:departure_date).map do |date|
      date.strftime("%Y-%m-%d")
    end
    dates.uniq
  end
end
