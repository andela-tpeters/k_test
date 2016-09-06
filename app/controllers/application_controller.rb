class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception unless %w(development test).include? Rails.env
  include SessionsHelper

  def index
    @user = User.new
    if current_user
      @decorated_user = UserDecorator.new(current_user)
    end
  end
end
