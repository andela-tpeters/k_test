module BookingsHelper
  def get_booking_cost(booking)
    (booking.cost_in_dollar if booking.cost_in_dollar) || '0.00'
  end
end