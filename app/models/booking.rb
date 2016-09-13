class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  has_one :payment
  before_create :set_booking_ref
  accepts_nested_attributes_for :passengers,
                                reject_if: :all_blank,
                                allow_destroy: true

  def set_booking_ref
    fake_ref = Faker::Internet.password(5, 5).upcase
    fake_num = Faker::Number.between(3, 3)
    self.booking_ref = "#{fake_ref}#{fake_num}"
  end
end
