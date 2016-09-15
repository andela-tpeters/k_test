class UsersController < ApplicationController
  respond_to :html, :js
  before_action :set_user
  before_action :set_flights, only: [:get_root, :schedule]

  def show

  end

  def get_root
    if current_user
      render user_home_path
    end
    render home_path unless current_user
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

  def schedule

  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_url
    else
      errors = @user.errors.full_messages.join('<br>')
      render :json => {:success => false, :errors => errors}
    end
  end

  def set_user
    @user = User.new
    @user = current_user if current_user
    @user = UserDecorator.new(@user)
  end

  def set_flights
    @flights = Flight.all.includes(
      route: [:departure_airport, :arrival_airport, airfares: [:travel_class]]
    )
    @flights = FlightDecorator.new(@flights)
  end

  def require_login
    unless signed_in?
      flash[:error] = require_login_message
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :id, :first_name, :last_name, :email, :password, :password_confirmation, :avatar
      )
    end
end