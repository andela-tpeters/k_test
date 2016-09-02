class User < ApplicationRecord
  include Clearance::User

  attr_protected :remember_token
end
