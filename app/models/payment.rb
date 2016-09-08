class Payment < ApplicationRecord
  enum status: [ :pending, :successful, :failed ]
  belongs_to :flight
  belongs_to :booking
  belongs_to :airfare
end
