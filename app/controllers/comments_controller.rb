class CommentsController < ApplicationController
	def create
		if params[:post_item_id]
			item = create_comment(PostItem, params[:post_item_id])
			redirect_to user_post_item_path(item.author.handle, item), notice: "Comment successfully added."
		elsif params[:medium_item_id]
			item = create_comment(MediumItem, params[:medium_item_id])
			redirect_to user_medium_item_path(item.author.handle, item), notice: "Comment successfully added."
		elsif params[:flickr_item_id]
			item = create_comment(FlickrItem, params[:flickr_item_id])
			redirect_to user_flickr_item_path(item.author.handle, item), notice: "Comment successfully added."
		end
	end

	private

	def create_comment(model, item_id)
		item = model.find(item_id)
		author = params[:comment][:author] || current_user.name
		item.blog_item.comments << Comment.create!(author: author, body: params[:comment][:body])
		item
	end
end