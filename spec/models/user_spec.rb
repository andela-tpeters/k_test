require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  scenario "when user is instantiated" do
    expect(@user).to respond_to(:password_confirmation)
    expect(@user).to respond_to(:remember_token)
    expect(@user).to respond_to(:authenticate)
  end

  describe "Remember Token" do
    before do
      @user.save
    end

    scenario "when user is saved with remember me" do
      expect(@user.remember_token).not_to be_blank
    end
  end
end
