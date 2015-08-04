class BlogItemsController < ApplicationController
	def index
		handle = params[:handle]
		@tag = params[:tag]
		@blog_user = User.find_by_handle(handle)
		if params[:tag].present?
			@blogitems = BlogItem.items_by_handle_and_tag(handle, @tag)
		else
			@blogitems = BlogItem.items_by_handle(handle)
		end
	end
end
