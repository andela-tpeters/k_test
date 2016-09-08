class UsersController < ApplicationController
  def show 
  end

  def index
    @user = User.new
    if current_user
      @user = UserDecorator.new(current_user)
      render user_home_path
    end
    render home_path unless current_user
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
      errors = @user.errors.full_messages.join('<br>')
      render :json => {:success => false, :errors => errors}
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end