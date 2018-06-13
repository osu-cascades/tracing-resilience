require 'rails_helper'

RSpec.describe Suggestion, type: :model do

  describe 'validations' do
    [:title, :category, :reference, :description].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
  end

end
