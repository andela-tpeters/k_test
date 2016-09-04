require 'rails_helper'

RSpec.describe "UsersLogin", type: :request do
  describe "GET /users_login" do
    it "works! (now write some real specs)" do
      get users_login_path
      expect(response).to have_http_status(200)
    end
  end

  describe "user logs in with invalid information" do
    get root_path
    post login_path, params: { session: { email: "", password: "" } }
    get 'users.json'
    expect(page).to have_content('Out')
  end
end
