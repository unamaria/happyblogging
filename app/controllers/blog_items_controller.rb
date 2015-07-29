class BlogItemsController < ApplicationController
	def index
		handle = params[:handle]
		@blogitems = BlogItem.joins(:author).where(users: {handle: handle}).order(created_at: :desc)
	end
end
