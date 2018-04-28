require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    [:role, :first_name, :last_name, :organization, :city, :state, :zip].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end

    # it { is_expected.to validate_acceptance_of(:terms_of_service)}
  end
end
