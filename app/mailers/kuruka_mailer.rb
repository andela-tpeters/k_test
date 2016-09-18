class KurukaMailer < ActionMailer::Base
  include MessagesHelper
  default from: "#{ENV['kuruka_email']}"
  layout 'mailer'

  def booking_email(booking)
    mail_to(booking, booking_mail_subject_message)
  end

  def booking_updated_email(booking)
    mail_to(booking, booking_update_mail_subject_message)
  end

  def contact_email(contact)
    @contact = contact
    mail(
      from: contact.email,
      to: "#{ENV['kuruka_email']}", 
      subject: contact_mail_subject_message
    )
  end

  def mail_to(booking, subject)
    @booking = booking
    mail(to: booking.user_email, subject: subject)
  end
end
