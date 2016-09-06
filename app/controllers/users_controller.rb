class UsersController < ApplicationController
  layout 'user'
  def show
      
  end

  def index
    @user = User.new
    if current_user
      @decorated_user = UserDecorator.new(current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to 'back'
      render :json => {:success => true}
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