require 'rails_helper'

RSpec.describe Flight, type: :model do
  before do
    create(:airport)
    create(:route)
    @flight = create :flight
  end

  describe "#has_many" do
    it "should have many bookings" do
      expect(@flight).to have_many(:bookings)
    end
  end

  describe "#belongs_to" do
    it "should belong to a aircraft" do
      expect(@flight).to belong_to(:aircraft)
    end
  end

  describe "#belongs_to" do
    it "should belong to a route" do
      expect(@flight).to belong_to(:route)
    end
  end

  describe "#search" do
    it "should search for flights" do
      expect(@flight.departure).to eql("Abuja")
    end
  end

  describe "#departure" do
    it "should return the departure city for flight" do
      expect(@flight.departure).to eql("Abuja")
    end
  end

  describe "#arrival" do
    it "should return the arrival city for flight" do
      expect(@flight.arrival).to eql("Abuja")
    end
  end

  describe ".top_recent" do
    it "should return the first 4 flights" do
      expect(Flight.top_recent[0]).to eql(@flight)
    end
  end

  describe ".next_recent" do
    context "when there are less than or equal to 4 flights" do
      it "should return 0 count" do
        expect(Flight.next_recent.count).to eql(0)
      end
    end

    context "when there are up to 8 flights" do
      it "should return 4 flights" do
        8.times do |number|
          create :flight
        end
        expect(Flight.next_recent.count).to eql(4)
      end
    end
  end

  describe ".last" do
    it "should return the last flight" do
      expect(Flight.last).to eql(@flight)
    end
  end
end
