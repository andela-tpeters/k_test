class HomeController < ApplicationController
  before_action :set_user
  before_action :set_flights, only: [:schedule]

  def get_root
    (redirect_to user_home_path if current_user) || (redirect_to home_path)
  end

  def set_flights
    @flights = Flight.include_joins
  end
end
