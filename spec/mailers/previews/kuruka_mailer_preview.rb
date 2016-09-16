# Preview all emails at http://localhost:3000/rails/mailers/kuruka_mailer
class KurukaMailerPreview < ActionMailer::Preview
  def booking_mail_preview
    @booking = Booking.last
    KurukaMailer.booking_email(@booking)
  end
end
