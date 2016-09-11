class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = log_in_message
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    elsif user.nil?
      render :json => {:success => false, :errors => "Your email is incorrect"}
    else
      render :json => {:success => false, :errors => "Your password is incorrect"}
    end
  end

  def destroy
    log_out if signed_in?
    flash[:success] = log_out_message
    redirect_to root_url
  end
end