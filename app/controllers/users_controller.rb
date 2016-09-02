class UsersController < ApplicationController
  def show
      
  end

  def index
      
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new
      @user.first_name = params[:user][:first_name]
      @user.last_name = params[:user][:last_name]
      @user.email = params[:user][:email]
      @user.password_digest = Auth.encrypt(params[:password])
      binding.pry
      if @user.save 
        # take user to dashboard

      else
        render :new
      end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end