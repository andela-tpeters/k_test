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
    respond_to do |format|
      format.html { 
        redirect_to new_booking_path(
          flight: flight, passengers: session[:passenger_count]
        )
      }
    end
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
    @booking = Booking.where(booking_ref: params[:booking_ref])
    respond_to do |format|
      format.html { 
        render partial: 'bookings/retrieved', locals: { 
          booking: @booking
        } 
      }
      format.js
    end
  end

  def confirmation
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers.map do |passenger|
      PassengerDecorator.new(passenger)
    end
  end

  def create
    if booking_params[:passengers_attributes].nil?
      flash[:error] = require_passenger_message
      redirect_back(fallback_location: new_booking_path)
    else
      @booking = Booking.new(booking_params)
      if @booking.save
        session[:passenger_count] = nil
        redirect_to Payment.paypal_url(@booking, booking_confirmation_path(@booking))
      else
        flash[:error] = @booking.errors.full_messages
        redirect_back(fallback_location: new_booking_path)
      end
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

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(
        :flight_id, :user_id, :cost_in_dollar,
        passengers_attributes:[
          :id, :first_name, :last_name, :phone, :_destroy, :airfare_id
        ]
      )
    end

    def set_user
      @user = User.new
      @user = current_user if current_user
      @user = UserDecorator.new(@user)
    end
end
