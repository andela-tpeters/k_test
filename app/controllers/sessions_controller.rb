class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirect_to root_url, notice: ""
      render :json => {:success => true, :errors => "You have been signed in"}
    else
      render :json => {:success => false, :errors => "Out!"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end