class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_user
  before_action :require_login, only: [:edit, :update, :index]

  def index
    @bookings = current_user.bookings if current_user
  end

  def select
    flight = Flight.find(params[:flight_radio])
    respond(new_booking_path(flight: flight,
      passengers: session[:passenger_count])
    )
  end

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:flight])
    @booking.user = current_user if current_user
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
    if @booking.save
      session[:passenger_count] = nil
      redirect_to booking_confirmation_path(@booking)
      # redirect_to Payment.paypal_url(@booking, booking_confirmation_path(@booking))
      send_booking_mail(@booking)
    else
      flash[:error] = @booking.errors.full_messages
      redirect_back(fallback_location: new_booking_path)
    end
  end

  def update
    if @booking.update(booking_params)
      flash[:success] = booking_update_success_message
      send_booking_update_mail(@booking)
    else
      flash[:error] = full_message(@booking)
    end
    redirect_back(fallback_location: edit_booking_path)
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
      cost
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
