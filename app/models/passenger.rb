class Passenger < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :booking

  validates :first_name,
            :last_name,
            presence: true,
            allow_nil: false
end
