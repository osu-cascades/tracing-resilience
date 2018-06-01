require 'rails_helper'

RSpec.describe Measure, type: :model do

  describe 'validations' do
    [:title, :category].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
  end

  describe '::category_options' do
    it "returns a Hash of Name => name pairs" do
      category_hash = {
        "General"=>"general",
        "Individual"=>"individual",
        "Relational"=>"relational",
        "Community"=>"community"
      }
      expect(Measure.category_options).to eq(category_hash)
    end
  end

end
