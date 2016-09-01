class Airport < ApplicationRecord
  belongs_to :state

  has_many :departure_ro, :class_name: "Route", foreign_key: debtor_id
  has_many :credits, :class_name: "Route", foreign_key: :creditor_id
end
