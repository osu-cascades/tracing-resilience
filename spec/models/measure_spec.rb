require 'rails_helper'

RSpec.describe Measure, type: :model do
  describe 'validations' do
    [:title, :category].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
  end
end
