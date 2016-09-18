class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    authenticated_user?(user) ? prepare_for_sign_in(user) : invalidate(user)
  end

  def invalidate(user)
    respond_json_error(invalid_field_message(user.nil? ? "email" : "password"))
  end

  def authenticated_user?(user)
    user && user.authenticate(params[:session][:password])
  end

  def destroy
    log_out if signed_in?
    flash[:success] = log_out_message
    redirect_to root_url
  end

  def prepare_for_sign_in(user)
    sign_in user
    flash[:success] = log_in_message
    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    redirect_to root_url
  end
end