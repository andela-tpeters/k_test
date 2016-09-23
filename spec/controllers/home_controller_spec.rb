require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'ROOT #get_root' do
    context 'when a user is registered' do
      it 'should redirect to user home' do
        create :user
        session[:user_id] = 1
        get :get_root
        expect(response).to redirect_to user_home_path
      end
    end

    context 'when a user is anonymous' do
      it 'should redirect to index home' do
        get :get_root
        expect(response).to redirect_to home_path
      end
    end
  end
end