class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = User.find(current_user.id) # or current_user.name etc in view?
	end
end