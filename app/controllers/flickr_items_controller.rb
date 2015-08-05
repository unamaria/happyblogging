class FlickrItemsController < ApplicationController
	before_action :find_photo, only: [:edit, :update, :show]
	# doesn't work because instead of id ther's the user handle in the url
	before_action :authenticate_user!, except: [:show, :index]

	def index
		@photos = current_user.flickr_items.order(created_at: :desc) # when link in index blog items won't work
	end

	def edit
	end

	def update
		@photo.update(title: params[:title], description: params[:description])
		tags = clean_tags_array(params[:tags])
		@photo.blog_item.create_or_find_tags(tags)
		redirect_to user_flickr_item_path(current_user.handle, @photo)
	end

	def show
		@blog_user = @blog_user = User.find_by_handle(params[:user_id])
	end

	def destroy
		photo = FlickrItem.find(params[:id])
		FlickrItem.destroy(photo)
		redirect_to root_path #photo.blog_item = nil, ?
	end

	private

	def find_photo
		@photo = FlickrItem.find(params[:id])
	end

	# def photo_item_params
	# 	params.require(:flickr_item).permit(:title, :description)
	# end

	def clean_tags_array(tags)
		tags.delete(' ').split(',')
	end
end