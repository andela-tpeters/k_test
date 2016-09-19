class FlightDecorator < Draper::Decorator
  delegate_all

  def by_day(date)
    object.where("departure_date between ? and ?",
      date.beginning_of_day, date.end_of_day
    )
  end

  def uniq_departure_dates
    dates = object.order(:departure_date).pluck(:departure_date).map do |date|
      date.strftime("%Y-%m-%d")
    end
    dates.uniq
  end

  def pastize(word)
    object.departed? ? (word[-1] == "e" ? "#{word}d" : "#{word}ed") : "#{word}s"
  end
end
