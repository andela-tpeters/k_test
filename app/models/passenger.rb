class Passenger < ApplicationRecord
  belongs_to :user, optional: true
  has_one :transaction

  validates :first_name,
            :last_name,
            presence: true,
            allow_nil: false
end
