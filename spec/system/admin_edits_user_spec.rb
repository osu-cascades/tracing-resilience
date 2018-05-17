require 'rails_helper'

RSpec.describe 'Admin edits user' do
  include Devise::Test::IntegrationHelpers

  context 'when logged in' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }

    before do
      sign_in(admin)
      visit users_path
    end

    scenario 'edits another user' do
      click_link user.to_s
      expect(page).to have_content(user.first_name)
      fill_in 'First name', with: 'New first name'
      click_button 'Update'
      expect(page).to have_content("#{@user.to_s} successfully updated.")
      expect(page).to have_content('New first name')
    end
  end
end
