class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email,
      :organization, :city, :state, :zip, :phone, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email,
      :organization, :city, :state, :zip, :phone, :password, :password_confirmation)
end
