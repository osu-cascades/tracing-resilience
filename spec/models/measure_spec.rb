require 'rails_helper'

RSpec.describe Measure, type: :model do

  describe 'validations' do
    [:title, :category].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
  end

  describe '::category_options' do
    it 'returns a Hash of Name => name pairs' do
      category_hash = {
        'General' => 'general',
        'Individual' => 'individual',
        'Relational' => 'relational',
        'Community' => 'community'
      }
      expect(Measure.category_options).to eq(category_hash)
    end
  end

  it 'has a string representation consisting of its title' do
    expect(Measure.new(title: 'FAKE').to_s).to eq 'FAKE'
  end

  describe 'featured' do
    it 'ensures there is only one featured measure' do
      unfeatured_measure = create(:measure)
      featured_measure = create(:featured_measure)
      expect(unfeatured_measure).to_not be_featured
      expect(featured_measure).to be_featured
      unfeatured_measure.featured = true
      unfeatured_measure.save!
      featured_measures = Measure.where('featured = true')
      expect(featured_measures.count).to eq(1)
      expect(featured_measures).to include(unfeatured_measure)
    end
  end

end
