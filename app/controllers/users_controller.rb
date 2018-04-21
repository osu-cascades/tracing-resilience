class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @admins = User.where(role: :admin)
    @guests = User.where(role: :guest)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to users_path
      flash[:success] = 'User successfully deleted.'
    end
  end

  def make_admin
    @user  = User.find(params[:id])
    @user.role = :admin
    @user.save

    if @user.save
      redirect_to users_path
      flash[:success] = "#{@user} is now an administrator."
    end
  end

  private

  def require_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'Restricted action, must be an administrator.'
    end
  end
end
