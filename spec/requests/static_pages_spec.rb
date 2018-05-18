require 'rails_helper'

RSpec.describe "Static pages" do

  context "when not logged in" do
    it "responds with a home page" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

end
