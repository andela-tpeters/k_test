class Airfare < ApplicationRecord
  belongs_to :route
  belongs_to :class
end
