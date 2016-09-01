Clearance.configure do |config|
  config.mailer_sender = Figaro.env.password_reset_sender_email
end
