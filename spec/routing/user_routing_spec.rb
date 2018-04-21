require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routes users pages' do
    it 'routes to #index' do
      expect(get: '/users').to route_to(controller: 'users', action: 'index')
    end
  end
end
