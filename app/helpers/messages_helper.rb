module MessagesHelper
  def log_out_message
    "You have been logged out successfully."
  end

  def log_in_message
    "You have been logged in successfully."
  end

  def no_flights_for_day_message
    "There are currently no flights for this date. This flight is only available on:"
  end

  def no_flights_message
    "There are currently no flights scheduled for the year. Please check back later"
  end
end