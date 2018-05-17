require 'rails_helper'

RSpec.describe 'User views user index' do
  include Devise::Test::IntegrationHelpers

  context 'when logged in' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }

    scenario 'as a guest' do
      sign_in(user)
      visit users_path
      expect(page).to have_selector '.alert', text: 'Restricted action, must be an administrator.'
    end

    scenario 'as an admin' do
      sign_in(admin)
      visit users_path
      expect(page).not_to have_selector '.alert', text: 'Restricted action, must be an administrator.'
    end
  end
end