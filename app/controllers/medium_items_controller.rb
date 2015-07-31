class MediumItemsController < ApplicationController
	before_action :find_medium, only: [:edit, :update, :show]
	# doesn't work because instead of id ther's the user handle in the url
	before_action :authenticate_user!, except: [:show, :index]

	def index
		@mediums = current_user.medium_items.order(created_at: :desc)
	end

	def new
		@medium = MediumItem.new
	end

	def create
		medium = MediumItem.new(medium_item_params)
		user = User.find_by_handle(params[:user_id])
		if medium.save
			create_blog_item(user, medium)
			redirect_to user_medium_item_path(user.handle, medium.id)
		else
			render :new
		end
	end

	def edit
	end

	def update
		@medium.update(medium_item_params)
		redirect_to user_medium_item_path(current_user, @medium)
	end

	def show
	end

	def destroy
		medium = MediumItem.find(params[:id])
		MediumItem.destroy(medium)
		redirect_to root_path #medium.blog_item = nil, ?
	end

	private

	def find_medium
		@medium = MediumItem.find(params[:id])
	end

	def medium_item_params
		params.require(:medium_item).permit(:title, :subtitle, :body)
	end

	def create_blog_item(user, medium)
		BlogItem.create!(user_id: user.id, item_id: medium.id, item_type: 'MediumItem')
	end
end