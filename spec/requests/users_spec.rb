require 'rails_helper'

RSpec.describe "Users requests" do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  context "when not logged in" do
    it "redirects to the sign in path" do
      get users_path
      expect(response).to redirect_to(new_user_session_path)
      get user_path(user)
      expect(response).to redirect_to(new_user_session_path)
      get edit_user_path(user)
      expect(response).to redirect_to(new_user_session_path)
      patch user_path(user)
      expect(response).to redirect_to(new_user_session_path)
      put user_path(user)
      expect(response).to redirect_to(new_user_session_path)
      delete user_path(user)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "when logged in as a registered user" do
    skip "allows listing and viewing" do

    end

    skip "redirects to root url" do

    end
  end

  context "when logged in as an admin" do
    skip "responds to everything" do

    end
  end

end
