class BlogItemsController < ApplicationController
	def index
		handle = params[:handle]
		@blogitems = BlogItem.joins(:author).where(users: {handle: handle})
	end
end
