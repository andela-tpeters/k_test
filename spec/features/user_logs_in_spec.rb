require "rails_helper"
require "support/features/users_helpers"

RSpec.feature "User logs in", js: true do
  before(:all) do
    create(:airport)
    create(:route)
    create(:flight)
    create_user "user@gmail.com", "password"
  end

  scenario "with invalid password", js: true do
    sign_in_with "user@gmail.com", "paSSword"

    expect_invalid_login_error
  end

  scenario "with invalid email", js: true do
    sign_in_with "wrong_user@gmail.com", "password"

    expect_invalid_login_error
  end

  scenario "with invalid email and invalid password", js: true do
    sign_in_with "wrong_user@gmail.com", "wrong_password"

    expect_invalid_login_error
  end

  private

    def create_user(email, password)
      create(:user, email: email, password: password)
    end
end
