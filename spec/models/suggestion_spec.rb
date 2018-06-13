require 'rails_helper'

RSpec.describe Suggestion, type: :model do

  describe 'validations' do
    [:title, :reference, :description].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
    it { should validate_presence_of(:category).with_message('must be selected') }
  end

end
