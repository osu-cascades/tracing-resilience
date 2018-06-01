require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    [:role, :first_name, :last_name, :organization, :city, :state, :zip].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
    it { is_expected.to validate_acceptance_of(:terms_of_use) }
  end

  it 'has a string representation consisting of first and last name' do
    expect(user.to_s).to eq "#{user.first_name} #{user.last_name}"
  end
end
