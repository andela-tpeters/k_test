class KurukaMailer < ActionMailer::Base
  include MessagesHelper
  default from: "#{ENV['booking_sender_email']}"
  layout 'mailer'

  def booking_email(booking)
    @booking = booking
    mail(to: booking.passenger_email, subject: booking_mail_subject_message)
  end
end
