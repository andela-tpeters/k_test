Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = Figaro.env.password_reset_sender_email
  config.cookie_expiration = lambda {|cookies| cookies[:remember_me] ? 1.years.from_now : nil }
end
