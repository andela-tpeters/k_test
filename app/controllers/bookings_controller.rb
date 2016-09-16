class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_user
  # before_action :require_login, only: [:new]

  def index
    @bookings = Booking.all
    if current_user
      @user = UserDecorator.new(current_user)
    end
    redirect_to home_path unless current_user
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

  def edit
  end

  def retrieve
    @booking = Booking.find_by(search_params)
    respond('bookings/booking_details', {booking: @booking})
  end

  def confirmation
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      session[:passenger_count] = nil
      redirect_to booking_confirmation_path(@booking)
      # redirect_to Payment.paypal_url(@booking, booking_confirmation_path(@booking))
    else
      flash[:error] = @booking.errors.full_messages
      redirect_back(fallback_location: new_booking_path)
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_booking_mail(booking)
    KurukaMailer.deliver_booking_email(booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
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

    def set_user
      @user = User.new
      @user = current_user if current_user
      @user = UserDecorator.new(@user)
    end
end
