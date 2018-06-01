require 'rails_helper'

RSpec.describe 'User management' do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as a guest' do
    let(:user) { create(:user) }

    scenario 'is restricted from viewing the list of users' do
      sign_in(user)
      visit users_path
      expect(page).to have_selector '.alert', text: 'Restricted action, must be an administrator.'
    end

    scenario 'editing their own profile' do
      new_last_name = 'FAKE'
      sign_in(user)
      visit root_path
      click_on 'My Profile'
      click_on 'Edit profile'
      fill_in 'Last name', with: new_last_name
      click_on 'Update'
      expect(page).to have_content('successfully updated')
      expect(page).to have_content(new_last_name)
    end
  end

  context 'when logged in as an admin' do
    let!(:admin) { create(:admin) }
    let!(:user) { create(:user) }

    before do
      sign_in(admin)
      visit users_path
    end

    scenario 'sees the list of users' do
      expect(page).to have_content('All Users')
      expect(page).to have_content(user.to_s)
      expect(page).to have_content(admin.to_s)
    end

    scenario 'edits user details' do
      new_last_name = 'FAKE'
      click_on 'Admin User'
      fill_in 'Last name', with: new_last_name
      click_on 'Update'
      expect(page).to have_content('successfully updated')
      expect(page).to have_content(new_last_name)
    end

    scenario 'cannot delete themselves' do
      within "#user_#{admin.id}" do
        expect(page).to_not have_link('Delete')
      end
    end

    scenario 'cannot elevate an admin' do
      within "#user_#{admin.id}" do
        expect(page).to_not have_link('Make admin')
      end
    end

    scenario 'can delete a user' do
      within "#user_#{user.id}" do
        click_on 'Delete'
      end
      expect(page).to have_content('successfully deleted')
      expect(page).to_not have_content(user.to_s)
    end

    scenario 'can elevate a guest user role to be an admin role' do
      within "#guests #user_#{user.id}" do
        click_on 'Make admin'
      end
      expect(page).to have_content('is now an administrator')
      within "#guests" do
        expect(page).to_not have_selector("#user_#{user.id}")
      end
      within "#admins" do
        expect(page).to have_selector("#user_#{user.id}")
      end
    end

  end
end
