class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_user
  before_action :require_login, only: [:edit, :update, :index]

  def index
    @bookings = current_user.bookings.order(created_at: :desc) if current_user
  end

  def select
    flight = Flight.find(params[:flight_radio])
    passenger_count = session[:passenger_count]
    respond(new_booking_path(flight: flight, passengers: passenger_count))
  end

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:flight])
    @booking.user = decorated_user if decorated_user
    @passenger_count = params[:passengers]
  end

  def retrieve
    @booking = Booking.find_by(search_params)
    respond_partial('bookings/booking_details', booking: @booking) if @booking
    respond_message("danger", no_booking_found_message(search_params)) unless @booking
  end

  def confirmation
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.cost_in_dollar = booking_cost(@booking)
    @booking.save ? process_booking(@booking) : throw_booking_error(@booking)
  end

  def process_booking(booking)
    clear_passenger_count
    redirect_to booking_confirmation_path(booking)
    # redirect_to Payment.paypal_url(booking, booking_confirmation_path(@booking))
    send_booking_mail(booking)
  end

  def throw_booking_error(booking)
    flash_message(:error, booking.errors.full_messages)
    redirect_back(fallback_location: new_booking_path)
  end

  def clear_passenger_count
    session[:passenger_count] = nil
  end

  def update
    @booking.update(booking_params) ? process_update(@booking) : throw_update_error(@booking)
    redirect_back(fallback_location: edit_booking_path)
  end

  def process_booking_update(booking)
    flash_message(:success, booking_update_success_message)
    send_booking_update_mail(booking)
  end

  def throw_booking_update_error(booking)
    flash_message(:error, full_message(booking))
  end

  def destroy
    @booking.destroy
    redirect_back(fallback_location: bookings_path)
  end

  def send_booking_mail(booking)
    KurukaMailer.booking_email(booking).deliver
  end

  def send_booking_update_mail(booking)
    KurukaMailer.booking_updated_email(booking).deliver
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_cost(booking)
      cost = 0
      booking.decorated_passengers.each { |passenger| cost += passenger.fare }
      "%.2f" % cost
    end

    def booking_params
      params.require(:booking).permit(
        :flight_id, :user_id, :cost_in_dollar, :passenger_email,
        passengers_attributes:[
          :id, :first_name, :last_name, :phone, :_destroy, :airfare_id
        ]
      )
    end

    def search_params
      params.require(:booking).permit(:booking_ref)
    end
end
