class FlickrDetailsController < ApplicationController
	before_filter :find_user, only: [:update, :create]

	def new
		@flickr_detail = FlickrDetail.new
	end

	def create
		create(flickr_detail_params.merge(
			{nsid: flickrID, user_id: @user.id}))

		redirect_to user_path(@user.handle)
	end

	def update
		flickr_detail = @user.flickr_detail.find(params[:id])
		flickr_detail.update(flickr_detail_params.merge(
			{nsid: flickrID}))

		redirect_to user_path(@user.handle)
	end

	private

	def flickr_detail_params
		params.require(:flickr_detail).permit(:username) 
	end

	def find_user
		@user = User.find_by_handle(params[:user_id])
	end
end