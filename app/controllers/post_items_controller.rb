class PostItemsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show]
	# doesn't work because instead of id ther's the user handle in the url
	before_action :authenticate_user!, except: [:show, :index]

	def index
		if params[:tag].present? 
       @posts = Post.where(tag: params[:tag])
			@posts = current_user.post_items.order(created_at: :desc)
     else 
			@posts = current_user.post_items.order(created_at: :desc)
     end
	end

	def new
		@post = PostItem.new
	end

	def create
		post = PostItem.new(title: params[:title], body: params[:body])
		tags = clean_tags_array(params[:tags])
		if post.save
			blog_item = create_blog_item(current_user, post)
			blog_item.create_or_find_tags(tags)
			redirect_to user_post_item_path(current_user.handle, post.id)
		else
			flash[:alert] = "A title and a body are required." 
			render :new
		end
	end

	def edit
		@tags = @post.blog_item.tags_to_string
	end

	def update
		@post.update(title: params[:title], body: params[:body])
		tags = clean_tags_array(params[:tags])
		@post.blog_item.create_or_find_tags(tags)
		redirect_to user_post_item_path(current_user.handle, @post), notice: "Post updated successfully."
	end

	def show
		@blog_user = @blog_user = User.find_by_handle(params[:user_id])
	end

	def destroy
		post = PostItem.find(params[:id])
		PostItem.destroy(post)
		redirect_to user_post_items_path(params[:user_id]), notice: "Post deleted successfully." #post.blog_item = nil, ?
	end

	private

	def find_post
		@post = PostItem.find(params[:id])
	end

	# def post_item_params
	# 	params.require(:post_item).permit(:title, :body)
	# end

	def create_blog_item(user, post)
		BlogItem.create!(user_id: user.id, item_id: post.id, item_type: 'PostItem')
	end

	def clean_tags_array(tags)
		tags = tags.split(',')
		tags.map { |tag| tag.strip }
	end
end