class PostItemsController < ApplicationController
	def index
		@posts = Post.joins(:author).where(users: {handle: params[:handle]})
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		user = User.find_by_handle(params[:user_id])
		post.author = user
		if post.save
			redirect_to user_post_path(user.handle, post.id)
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end