require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:contact_params) do
    {
      name: "Chineze",
      email: "user@gmail.com",
      message: "Hi, I am happy"
    }
  end

  describe "#send_mail" do
    it "sends a mail to Kuruka" do
      contact = Contact.new contact_params
      kuruka_mailer = KurukaMailer.contact_email(contact)
      expect {kuruka_mailer.deliver}.to change { 
        ActionMailer::Base.deliveries.count
      }.by(1)
    end

    it "returns a json response" do
      post :send_mail, params: { contact: contact_params }
      contact = Contact.new contact_params
      kuruka_mailer = KurukaMailer.contact_email(contact)
      expect(response.content_type).to eq("application/json")
    end
  end
end
