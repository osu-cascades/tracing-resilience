require 'rails_helper'

RSpec.describe 'Measure management' do
  include Devise::Test::IntegrationHelpers

  let(:admin) { create(:admin) }
  let(:measure) { create(:measure) }
  let(:featured_measure) { build(:featured_measure) }

  before do
    sign_in(admin)
  end

  context 'admin creates new measure' do

    before do
      visit new_measure_path
    end

    scenario 'providing valid measure attributes' do
      fill_in('Title', with: 'Example title')
      fill_in('Description', with: 'Fake description')
      fill_in('Details', with: 'Fake details')
      select('General', from: 'Category')
      page.attach_file('Document', Rails.root + 'spec/factories/attachments/example.pdf')
      click_on('Save')
      expect(page).to have_content('Measure was successfully created.')
    end

    scenario 'providing invalid measure attributes' do
      click_on('Save')
      expect(page).to have_selector '#error_explanation', text: '3 errors prohibited this measure from being saved:'
      page.find('#error_explanation').tap do |error_explanations|
        expect(error_explanations).to have_content("Title can't be blank")
        expect(error_explanations).to have_content("Category can't be blank")
        expect(error_explanations).to have_content("Description can't be blank")
      end
    end
  end

  context 'admin edits measure' do

    before do
      visit edit_measure_path(measure)
    end

    scenario 'providing valid measure attributes' do
      fill_in('Title', with: 'New title')
      select('Community', from: 'Category')
      click_on('Save')
      expect(page).to have_content('Measure was successfully updated.')
    end

    scenario 'providing invalid measure attributes' do
      fill_in('Title', with: '')
      fill_in('Description', with: '')
      select('Choose...', from: 'Category')
      click_on('Save')
      expect(page).to have_selector '#error_explanation', text: '3 errors prohibited this measure from being saved:'
      page.find('#error_explanation').tap do |error_explanations|
        expect(error_explanations).to have_content("Title can't be blank")
        expect(error_explanations).to have_content("Category can't be blank")
        expect(error_explanations).to have_content("Description can't be blank")
      end
    end
  end

  context 'with an existing featured measure' do

    before do
      visit new_measure_path
      create_new_measure(category: 'Relational', featured: true)
    end

    scenario 'admin sets new featured measure' do
      expect(Measure.count).to eq(1)
      expect(featured_measure_count).to eq(1)
      expect(Measure.first.featured).to equal(true)

      create_new_measure(category: 'Individual', featured: true)
      expect(Measure.count).to eq(2)
      expect(featured_measure_count).to eq(1)
      expect(Measure.first.featured).to equal(false)
      expect(Measure.last.featured).to equal(true)
    end

  end

end
