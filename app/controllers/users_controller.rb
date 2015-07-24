class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new user_params
		if user.save
			session[:user_id] = user.id
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@user = User.find(current_user.id) # or current_user.name etc in view?
	end

	private

	def user_params
		params.require(:user).permit(:handle, :email, :password, :password_confirmation)
	end
end