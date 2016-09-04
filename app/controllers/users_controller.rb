class UsersController < ApplicationController
  def show
      
  end

  def index
      @user = User.new
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :json => {:success => true}
    else
      errors = @user.errors.full_messages.join(", ")
      render :json => {:success => false, :errors => errors}
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end