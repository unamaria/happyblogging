class PostItemsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show]
	# doesn't work because instead of id ther's the user handle in the url
	before_action :authenticate_user!, except: [:show, :index]

	def index
		@posts = current_user.post_items.order(created_at: :desc) # when link in index blog items won't work
	end

	def new
		@post = PostItem.new
	end

	def create
		# post = PostItem.new(post_item_params)
		post = PostItem.new(title: params[:title], body: params[:body])
		user = User.find_by_handle(params[:user_id])
		tags = clean_tags_array(params[:tags])
		if post.save
			blog_item = create_blog_item(user, post)
			create_or_find_tags(tags, blog_item)
			redirect_to user_post_item_path(user.handle, post.id)
		else
			render :new
		end
	end

	def edit
	end

	def update
		@post.update_attributes(post_item_params)
		redirect_to user_post_item_path(current_user, @post)
	end

	def show
	end

	def destroy
		post = PostItem.find(params[:id])
		PostItem.destroy(post)
		redirect_to root_path #post.blog_item = nil, ?
	end

	private

	def find_post
		@post = PostItem.find(params[:id])
	end

	def post_item_params
		params.require(:post_item).permit(:title, :body)
	end

	def create_blog_item(user, post)
		BlogItem.create!(user_id: user.id, item_id: post.id, item_type: 'PostItem')
	end

	def clean_tags_array(tags)
		tags.delete(' ').split(',')
	end

	def create_or_find_tags(tags, blog_item)
		tags.each do |tag| 
			tag = Tag.find_or_create_by(name: tag)
			blog_item.tags << tag
		end
	end
end