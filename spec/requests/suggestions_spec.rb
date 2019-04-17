require 'rails_helper'

RSpec.describe "Suggestions requests" do

  let(:user) { create(:user) }

  context "when not logged in" do
    it "redirects to the sign in path" do
      get new_suggestion_path
      expect(response).to redirect_to(new_user_session_path)
      post suggestions_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "when logged in as a guest" do
    it "allows new-ing and creating" do
      sign_in user
      get new_suggestion_path
      expect(response).to have_http_status(:ok)
      post suggestions_path, params: { suggestion: {title: 'Title', category: :general, reference: 'Example', description: 'Example'} }
      expect(response).to redirect_to(measures_url)
    end
  end

end
