class PostsController < ApplicationController
	def index
		# not working
		raise params[:handle]
		@posts = Post.joins(:author).where(users: {handle: params[:handle]})
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		if post.save
			handle = params[:handle]
			redirect_to post_path(handle, post.id)
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:post_id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end