class RegistrationsController < Devise::RegistrationsController
	protected

  def after_sign_up_path_for(resource)
    user_path(current_user.handle)
  end

	private

  def sign_up_params
    params.require(:user).permit(:handle, :name, :email, :password)
  end

  def account_update_params
    params.require(:user).permit(:handle, :name, :email, :password, :current_password)
  end
end
