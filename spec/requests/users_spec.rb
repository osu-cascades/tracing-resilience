require 'rails_helper'

RSpec.describe "Users requests" do

  let(:user) { create(:user) }
  let(:user_attributes) { attributes_for(:user) }
  let(:admin) { create(:admin) }

  context "when not logged in" do
    it "redirects to the sign in path" do
      get users_path
      expect(response).to redirect_to(new_user_session_path)
      get user_path(user)
      expect(response).to redirect_to(new_user_session_path)
      put elevate_user_path(user)
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

    before { sign_in user }

    it "allows viewing, editing and updating the current user" do
      get user_path(user)
      expect(response).to have_http_status(:ok)
      get edit_user_path(user)
      expect(response).to have_http_status(:ok)
      patch user_path(user), params: { user: user_attributes}
      expect(response).to redirect_to(user_path(user))
      put user_path(user), params: { user: user_attributes}
      expect(response).to redirect_to(user_path(user))
    end

    it "redirects when viewing, editing or updating another user" do
      get user_path(admin)
      expect(response).to redirect_to(root_path)
      get edit_user_path(admin)
      expect(response).to redirect_to(root_path)
      patch user_path(admin)
      expect(response).to redirect_to(root_path)
      put user_path(admin)
      expect(response).to redirect_to(root_path)
    end

    it "redirects when listing, adminifying, or deleting users" do
      get users_path
      expect(response).to redirect_to(root_path)
      put elevate_user_path(user)
      expect(response).to redirect_to(root_path)
      delete user_path(user)
      expect(response).to redirect_to(root_path)
    end
  end

  context "when logged in as an admin" do
    it "responds to everything" do
      sign_in admin
      get users_path
      expect(response).to have_http_status(:ok)
      get user_path(user)
      expect(response).to have_http_status(:ok)
      put elevate_user_path(user)
      expect(response).to redirect_to(users_path)
      get edit_user_path(user)
      expect(response).to have_http_status(:ok)
      patch user_path(user), params: { user: user_attributes}
      expect(response).to redirect_to(user_path(user))
      put user_path(user), params: { user: user_attributes}
      expect(response).to redirect_to(user_path(user))
      delete user_path(user)
      expect(response).to redirect_to(users_path)
    end
  end

end
