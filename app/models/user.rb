class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email
  before_save :downcase_email

  def downcase_email
    self.email = self.email.downcase
  end
end
