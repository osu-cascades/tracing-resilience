class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :require_admin, only: [:index, :destroy, :elevate]
  before_action :require_admin_or_current_user, only: [:show, :edit, :update]

  def index
    @admins = User.where(role: :admin)
    @guests = User.where(role: :guest)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:success] = "#{@user.to_s} successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to users_path(alert: 'Deleting your own account is prohibited.' )
    elsif @user.destroy
      redirect_to users_path
      flash[:success] = 'User successfully deleted.'
    end
  end

  def elevate
    @user = User.find(params[:id])
    @user.role = :admin
    if @user.save
      redirect_to users_path
      flash[:success] = "#{@user} is now an administrator."
    end
  end

  private

  def require_admin_or_current_user
    unless current_user.admin? or current_user == User.find(params[:id])
      redirect_to root_path
      flash[:alert] = 'Restricted action.'
    end
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :organization,
      :city, :state, :zip, :phone)
  end

end
