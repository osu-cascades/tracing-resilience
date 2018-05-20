require 'rails_helper'

RSpec.describe "Measures requests" do

  let(:measure) { create(:individual_measure) }
  let(:measure_attributes) { attributes_for(:individual_measure) }
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
      get measures_path
      expect(response).to have_http_status(:ok)
      get measure_path(measure)
      expect(response).to have_http_status(:ok)
      get general_measures_path
      expect(response).to have_http_status(:ok)
      get individual_measures_path
      expect(response).to have_http_status(:ok)
      get relational_measures_path
      expect(response).to have_http_status(:ok)
      get community_measures_path
      expect(response).to have_http_status(:ok)
    end

    it "redirects when new, edit, create, update and delete" do
      sign_in user
      get new_measure_path
      expect(response).to redirect_to(root_path)
      get edit_measure_path(measure)
      expect(response).to redirect_to(root_path)
      post measures_path
      expect(response).to redirect_to(root_path)
      patch measure_path(measure)
      expect(response).to redirect_to(root_path)
      put measure_path(measure)
      expect(response).to redirect_to(root_path)
      delete measure_path(measure)
      expect(response).to redirect_to(root_path)
    end
  end

  context "when logged in as an admin" do
    it "responds to everything" do
      sign_in admin
      get measures_path
      expect(response).to have_http_status(:ok)
      get general_measures_path
      expect(response).to have_http_status(:ok)
      get individual_measures_path
      expect(response).to have_http_status(:ok)
      get relational_measures_path
      expect(response).to have_http_status(:ok)
      get community_measures_path
      expect(response).to have_http_status(:ok)
      get measure_path(measure)
      expect(response).to have_http_status(:ok)
      get new_measure_path
      expect(response).to have_http_status(:ok)
      get edit_measure_path(measure)
      expect(response).to have_http_status(:ok)
      post measures_path, params: { measure: measure_attributes }
      expect(response).to have_http_status(:ok)
      patch measure_path(measure), params: { measure: measure_attributes }
      expect(response).to redirect_to(measure)
      put measure_path(measure), params: { measure: measure_attributes }
      expect(response).to redirect_to(measure)
      delete measure_path(measure)
      expect(response).to redirect_to(measures_path)
    end
  end

end
