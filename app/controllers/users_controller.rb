class UsersController < ApplicationController
  respond_to :html, :js
  before_action :set_user
  before_action :set_flights, only: [:get_root, :schedule]

  def get_root
    current_user ? (render user_home_path) : (render home_path)
  end

  def update
    params = user_params.reject! {|key, value| value.blank?}
    if @user.update(params)
      flash[:success] = updated_avatar_message
    else
      flash[:error] = updated_avatar_error_message
    end
    redirect_back(fallback_location: root_url)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_url
    else
      errors = full_message(@user)
      render :json => {:success => false, :errors => errors}
    end
  end

  def set_flights
    @flights = Flight.all.includes(
      route: [:departure_airport, :arrival_airport, airfares: [:travel_class]]
    )
    @flights = FlightDecorator.new(@flights)
  end

  private

    def user_params
      params.require(:user).permit(
        :id, :first_name, :last_name, :email, :password, :password_confirmation, :avatar
      )
    end
end