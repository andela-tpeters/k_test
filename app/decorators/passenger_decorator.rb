class PassengerDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def fare
    object.airfare.total_fare_in_dollar
  end
end