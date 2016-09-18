class ContactsController < ApplicationController
  def send_mail
    @contact = Contact.new(contact_params)
    send_contact_mail(@contact)
    render json: { success: true, message: contact_success_message }
  end

  def send_contact_mail(contact)
    KurukaMailer.contact_email(contact).deliver
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
