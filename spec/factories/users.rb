FactoryGirl.define do
  factory :user do
    first_name "Chineze"
    last_name "Nwosu"
    email "user@gmail.com"
    password Auth.encrypt("password")
    remember_digest SecureRandom.urlsafe_base64
  end
end
