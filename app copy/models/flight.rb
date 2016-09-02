class Flight < ApplicationRecord
  belongs_to :aircraft
  belongs_to :airfare
  belongs_to :route
end
