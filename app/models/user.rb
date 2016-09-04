class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

  validates :first_name,
            :last_name,
            :email,
            presence: true,
            allow_nil: false

  validates :email,
            format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
            uniqueness: true

  validates :password,
            length: { minimum: 6 }

  def downcase_email
    self.email = self.email.downcase
  end
end
