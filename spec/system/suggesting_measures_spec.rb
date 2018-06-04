require 'rails_helper'

RSpec.describe 'Suggesting a measure' do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }

  before do
    ActionMailer::Base.deliveries.clear
    sign_in(user)
    visit new_suggestion_path
  end

  scenario 'successfully, with valid form completion' do
    fill_in 'Title', with: 'Fake Title'
    select 'Individual', from: 'Category'
    fill_in 'Reference', with: 'Fake Reference'
    fill_in 'Description', with: 'Fake description'
    click_on 'Submit'
    expect(page).to have_content('suggestion has been sent')
    expect(ActionMailer::Base.deliveries.size).to eq(1)
    email = ActionMailer::Base.deliveries.first
    expect(email.subject).to eq("TRACES Resilience Measure Suggestion")
  end

  xscenario 'failure, with invalid form completion' do
    #TODO
  end

end
