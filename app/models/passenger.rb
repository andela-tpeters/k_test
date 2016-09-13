class Passenger < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :booking
  belongs_to :airfare

  validates :first_name,
            :last_name,
            presence: true,
            allow_nil: false
end
