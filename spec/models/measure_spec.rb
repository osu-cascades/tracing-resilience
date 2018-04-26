require 'rails_helper'

RSpec.describe Measure, type: :model do
  describe 'validations' do
    [:title, :category].each do |a|
      it { is_expected.to validate_presence_of(a) }
    end
  end
end
