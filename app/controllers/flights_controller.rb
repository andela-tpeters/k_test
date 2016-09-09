class FlightsController < ApplicationController
  respond_to :html, :js

  def show
    @flights = Flight.all
  end

  def search
    binding.pry
    @flight = Flight.search(search_params)
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

  private
    
  def search_params
    params.require(:route).permit(
      [
        :departure_date,
        arrival: [:id],
        departure: [:id]
      ]
    )
  end
end
