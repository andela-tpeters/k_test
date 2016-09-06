class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email
  before_save :generate_remember_token

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

  private
  
    def generate_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
