class PostItemsController < ApplicationController
	def index
		# postitems don't have author (blog items do)
		# @posts = PostItem.joins(:author).where(users: {handle: params[:handle]})
	end

	def new
		@post = PostItem.new
	end

	def create
		post = PostItem.new(post_item_params)
		user = User.find_by_handle(params[:user_id])
		if post.save
			create_blog_item(user, post)
			redirect_to user_post_item_path(user.handle, post.id)
		else
			render :new
		end
	end

	def show
		@post = PostItem.find(params[:id])
	end

	private

	def post_item_params
		params.require(:post_item).permit(:title, :body)
	end

	def create_blog_item(user, post)
		BlogItem.create!(user_id: user.id, item_id: post.id, item_type: 'Post')
	end
end