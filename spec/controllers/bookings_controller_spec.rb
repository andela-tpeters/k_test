require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe "GET #index" do
    before do
      load "#{Rails.root}/spec/support/seed.rb"
      Seed.all
    end
    context "when a user is registered" do
      it "returns all the bookings made by the user" do
        
      end
    end
  end
end
