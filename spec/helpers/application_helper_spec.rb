require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    it 'returns the base title without arguments' do
      expect(helper.full_title).to eq('TRACES Resilience Measures')
    end

    it 'returns the page title and screen title with page argument' do
      expect(helper.full_title('FAKE')).to eq('FAKE | TRACES Resilience Measures')
    end
  end
end
