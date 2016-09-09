class UsersController < ApplicationController
  before_action :set_user, :set_flights

  def show

  end

  def index
    if @user
      render user_home_path
    end
    render home_path unless current_user
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
    if current_user
      @user = UserDecorator.new(current_user)
    end
  end

  def set_flights
    @flight = Flight.all
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end