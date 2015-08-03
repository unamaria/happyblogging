class FlickrDetailsController < ApplicationController
	before_action :find_user, only: [:edit, :update, :create]

	def new
		@flickr_detail = FlickrDetail.new
	end

	def create
		flickrID = FlickrContentService.flickrID(params['flickr_detail']['username'])
		FlickrDetail.create(flickr_detail_params.merge(
			{nsid: flickrID, user_id: @user.id}))

		redirect_to user_path(@user.handle)
	end

	def edit
		@flickr_detail = @user.flickr_detail
	end

	def update
		flickrID = FlickrContentService.flickrID(params[:username])
		flickr_detail = @user.flickr_detail
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