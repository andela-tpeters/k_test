class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception unless %w(development test).include? Rails.env
end
