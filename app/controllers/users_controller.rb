class UsersController < ApplicationController
  before_action :set_user
  before_action :set_flights, only: [:schedule]

  def get_root
    current_user ? (render user_home_path) : (render home_path)
  end

  def update
    params = user_params.reject! {|key, value| value.blank?}
    if @user.update(params)
      flash_message(:success, updated_user_message)
    else
      flash_message(:error, full_message(@user))
    end
    redirect_back(fallback_location: root_url)
  end

  def create
    @user = User.new(user_params)
    @user.save ? process_log_in(@user) : respond_json_error(full_message(@user))
  end

  def process_log_in(user)
    sign_in user
    redirect_to root_url
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
        :id, :first_name, :last_name, :email,
        :password, :password_confirmation, :avatar
      )
    end
end