class BlogItemsController < ApplicationController
	def index
		handle = params[:handle]
		@blog_user = User.find_by_handle(handle)
		@blogitems = BlogItem.joins(:author).where(users: {handle: handle}).order(created_at: :desc)
	end
end
