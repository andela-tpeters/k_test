class Airfare < ApplicationRecord
  belongs_to :travel_class
  belongs_to :route
  has_many :payments
  has_many :passengers

  def service_charge_in_currency(country)
    service_charge_in_dollar * country.exchange_rate
  end

  def tax_in_currency(country)
    service_charge_in_currency(country) * travel_class.tax_percent
  end

  def tax_in_dollar(country)
    service_charge_in_dollar * travel_class.tax_percent
  end

  def total_fare_in_dollar
    service_charge_in_dollar + tax_in_dollar
  end

  def total_fare_in_currency
    service_charge_in_currency + tax_in_currency
  end
end
