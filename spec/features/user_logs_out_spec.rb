require "rails_helper"
require "support/features/users_helpers"

RSpec.feature "User" do
  before(:all) do
    create(:airport)
    create(:route)
    create(:flight)
  end

  scenario "signs out" do
    sign_in
    sign_out

    expect_user_to_be_signed_out
  end
end
