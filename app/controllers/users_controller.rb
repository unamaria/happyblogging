class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = current_user
	end

	def edit
	end

	def update
		current_user.update(user_params)
		redirect_to user_path(current_user.handle)
	end

	private

	def user_params
		params.require(:user).permit(:styles)
	end
end