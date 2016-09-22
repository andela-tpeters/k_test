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

  describe "#name" do
    it "should return the name of the aircraft" do
      expect(@flight.name).to eql('5N-3HD5')
    end
  end

  describe "#route_airports" do
    it "should return the departure and arrival airport name" do
      expect(@flight.route_airports).
        to eql('Nnamdi Azikiwe Airport to Nnamdi Azikiwe Airport')
    end
  end

  describe "#departed?" do
    it "should return true" do
      @departed_flight = create :departed
      expect(@departed_flight.departed?).to eql(true)
    end
  end

  describe "#instance_methods" do
    it "should respond to" do
      expect(@flight).to respond_to(:name)
    end

    it "should respond to" do
      expect(@flight).to respond_to(:arrival)
    end

    it "should respond to" do
      expect(@flight).to respond_to(:departure)
    end
  end

  describe "#class_methods" do
    it "should respond to" do
      expect(Flight).to respond_to(:set)
    end

    it "should respond to" do
      expect(Flight).to respond_to(:search)
    end

    it "should respond to" do
      expect(Flight).to respond_to(:search_by_current)
    end

    it "should respond to" do
      expect(Flight).to respond_to(:search_by_params)
    end

    it "should respond to" do
      expect(Flight).to respond_to(:by_day)
    end

    it "should respond to" do
      expect(Flight).to respond_to(:uniq_departure_dates)
    end
  end
end
