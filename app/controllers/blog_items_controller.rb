class BlogItemsController < ApplicationController
	def index
		handle = params[:handle]
		@blog_user = User.find_by_handle(handle)
		if params[:tag].present?
			@blogitems = BlogItem.items_by_tag(params[:tag])
		else
			@blogitems = BlogItem.items_by_handle(handle) # FILTER BY AUTHOR
		end
	end
end
