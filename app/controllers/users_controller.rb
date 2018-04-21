class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @admins = User.where(role: :admin)
    @guests = User.where(role: :guest)
  end

  private

  def require_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'Restricted action, must be an administrator.'
    end
  end
end
