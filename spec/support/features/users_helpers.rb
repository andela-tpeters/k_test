module Features
  module UserHelpers
    def sign_in
      password = "password"
      user = FactoryGirl.create(:user, password: password)
      sign_in_with user.email, password
    end

    def sign_in_with(email, password)
      visit root_path
      find_link('Sign In').click
      fill_in "session[email]", with: email
      fill_in "session[password]", with: password
      find_button("Log In").click
    end

    def sign_out
      find_link('Log Out', match: :first).click
    end

    def sign_up_with(first_name, last_name, email, password)
      visit root_path
      find_link('Sign In').click
      fill_in "user[first_name]", with: first_name
      fill_in "user[last_name]", with: last_name
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      find_button("Create Account").click
    end

    def expect_user_to_be_signed_in
      visit root_path
      expect(page).to have_button "Log Out"
    end

    def expect_user_to_be_signed_out
      expect(page).to have_content "Sign In"
    end
  end
end

RSpec.configure do |config|
  config.include Features::UserHelpers, type: :feature
end
