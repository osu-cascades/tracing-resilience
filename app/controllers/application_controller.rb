class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'Restricted action, must be an administrator.'
    end
  end

  def after_sign_in_path_for(resource)
    measures_path
  end
end
