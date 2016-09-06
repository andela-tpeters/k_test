class Transaction < ApplicationRecord
  enum status: [ :pending, :successful, :failed ]
  belongs_to :flight
  belongs_to :passenger
  belongs_to :airfare
end
