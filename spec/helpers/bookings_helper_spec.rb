require 'rails_helper'

RSpec.describe BookingsHelper, type: :helper do
  describe BookingsHelper do
    before(:all) do
      create(:airport)
      create(:route)
      create(:flight)
      @booking = create :booking
    end

    describe "get_booking_cost" do
      it "returns 0.00" do
        expect(helper.get_booking_cost(@booking)).to eq('0.00')
      end

      it "returns the booking cost" do
        @booking.cost_in_dollar = '123.45'
        @booking.save
        expect(helper.get_booking_cost(@booking)).to eq(123.45)
      end
    end
  end
end
