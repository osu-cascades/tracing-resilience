require 'rails_helper'

RSpec.describe "Measures requests" do

  let(:measure) { create(:individual_measure) }
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  context "when not logged in" do
    it "redirects to the sign in path" do
      get measures_path
      expect(response).to redirect_to(new_user_session_path)
      get general_measures_path
      expect(response).to redirect_to(new_user_session_path)
      get individual_measures_path
      expect(response).to redirect_to(new_user_session_path)
      get relational_measures_path
      expect(response).to redirect_to(new_user_session_path)
      get community_measures_path
      expect(response).to redirect_to(new_user_session_path)
      get measure_path(measure)
      expect(response).to redirect_to(new_user_session_path)
      get new_measure_path
      expect(response).to redirect_to(new_user_session_path)
      get edit_measure_path(measure)
      expect(response).to redirect_to(new_user_session_path)
      post measures_path
      expect(response).to redirect_to(new_user_session_path)
      patch measure_path(measure)
      expect(response).to redirect_to(new_user_session_path)
      put measure_path(measure)
      expect(response).to redirect_to(new_user_session_path)
      delete measure_path(measure)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "when logged in as a registered user" do
    it "allows listing and viewing" do
      sign_in user
    end

    skip "redirects to root url" do

    end
  end

  context "when logged in as an admin" do
    skip "responds to everything" do

    end
  end

end
