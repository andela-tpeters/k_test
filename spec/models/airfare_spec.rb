require 'rails_helper'

RSpec.describe Airfare, type: :model do
  before do
    @country = create(:country)
    create(:airport)
    create(:route)
    create(:flight)
    @airfare = create(:airfare)
  end

  describe "#belong_to" do
    it "should belong to a travel class" do
      expect(@airfare).to belong_to(:travel_class) 
    end
  end

  describe "#belong_to" do
    it "should belong to route" do
      expect(@airfare).to belong_to(:route) 
    end
  end

  describe "#has_many" do
    it "should have many passengers" do
      expect(@airfare).to have_many(:passengers) 
    end
  end

  describe "#service_charge_in_currency" do
    it "should return a converted charge" do
      charge = @airfare.service_charge_in_currency(@country)
      expect(charge).to equal(315000.0)
    end
  end

  describe "#total_fare_in_dollar" do
    it "should return the total fare in dollar" do
      expect(@airfare.total_fare_in_dollar).to equal(1100.0)
    end
  end

  describe "#total_fare_in_currency" do
    it "should return the total fare in converted charge" do
      charge = @airfare.total_fare_in_currency(@country)
      expect(charge.to_f).to equal(346500.0)
    end
  end
end
