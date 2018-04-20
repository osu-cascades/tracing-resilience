require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    [:role, :first_name, :last_name, :organization, :city, :state, :zip].each do |a|
      it { is_expected.to validate_presence_of(a) }
    end

    it { is_expected.to validate_acceptance_of(:terms_of_service)}
  end
end
