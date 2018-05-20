require 'rails_helper'

RSpec.describe "Measures requests" do

  let(:user) { create(:user) }

  context "when not logged in" do
    it "redirects to the sign in path" do
      get suggestion_path
      expect(response).to redirect_to(new_user_session_path)
      post suggestion_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "when logged in as a guest" do
    it "allows listing and viewing" do
      get suggestion_path
      expect(response).to have_http_status(:ok)
      post suggestion_path
      expect(response).to have_http_status(:ok)
    end
  end

end
