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
    "There are currently no flights scheduled for the year. Please check back later."
  end

  def updated_user_message
    "Your profile has been updated successfully."
  end

  def require_login_message
    "You must be logged in to access this section."
  end

  def confirmed_booking_message
    "Your details are shown below. This has also been sent to your email."
  end

  def booking_mail_subject_message
    "Kuruka Booking Confirmed!"
  end

  def no_booking_found_message(booking_param)
    "No booking with reference number #{booking_param[:booking_ref]} was found"
  end

  def booking_update_success_message
    "Your reservation was successfully updated."
  end

  def full_message(model)
    model.errors.full_messages.join('<br>')
  end

  def flight_departed_message
    "This action cannot be done because the flight has already departed"
  end
end