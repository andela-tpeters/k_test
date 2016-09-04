FactoryGirl.define do
  factory :user do
    first_name "Chineze"
    last_name "Nwosu"
    email "abc@gmail.com"
    password_digest Auth.encrypt("password")
    remember_token SecureRandom.urlsafe_base64
  end
end
