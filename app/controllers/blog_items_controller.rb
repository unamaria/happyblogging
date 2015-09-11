class BlogItemsController < ApplicationController
	def index
		handle = params[:handle]
		@tag = params[:tag]
		@blog_user = User.find_by_handle(handle)
		if params[:tag].present?
			@blogitems = BlogItem.items_by_handle_and_tag(handle, @tag).paginate(
				:page => params[:page], :per_page => 10)
		else
			@blogitems = BlogItem.items_by_handle(handle).paginate(
				:page => params[:page], :per_page => 10)
		end
	end
end
