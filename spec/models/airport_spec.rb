require 'rails_helper'

RSpec.describe Airport, type: :model do
  before do
    @airport = create(:airport)
  end

  describe "#has_many" do
    it "should have many departure routes" do
      expect(@airport).to have_many(:departure_routes)
    end
  end

  describe "#has_many" do
    it "should have many arrival routes" do
      expect(@airport).to have_many(:arrival_routes)
    end
  end

  describe "#iata_name" do
    it "should return a city and iata name" do
      expect(@airport.iata_name).to eql("Abuja (ABV)")
    end
  end
end
