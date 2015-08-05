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
		# updates styles
		current_user.update(user_params)
		redirect_to user_index_path(current_user.handle)
	end

	def sync_data
  	user = User.find_by_handle(params[:handle])
		if user.medium_detail
			MediumContentService.items(user)
		end
		if user.flickr_detail
			FlickrContentService.items(user)
		end
		redirect_to user_index_path(user.handle), notice: "Content successfully added!"
	end

	private

	def user_params
		params.require(:user).permit(:styles)
	end
end