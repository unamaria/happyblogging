class CommentsController < ApplicationController
	def create
		if params[:post_item_id]
			item = create_comment(PostItem, params[:post_item_id])
			redirect_to user_post_item_path(item.author.handle, item)
		elsif params[:medium_item_id]
			item = create_comment(MediumItem, params[:medium_item_id])
			redirect_to user_medium_item_path(item.author.handle, item)
		elsif params[:flickr_item_id]
			item = create_comment(FlickrItem, params[:flickr_item_id])
			redirect_to user_flickr_item_path(item.author.handle, item)
		end
	end

	private

	def create_comment(model, item_id)
		item = model.find(item_id)
		author = params[:comment][:author] || current_user.name
		comment = Comment.new(author: author, body: params[:comment][:body])
		if comment.save
			flash[:notice] = "Comment successfully added."
			item.blog_item.comments << comment
		else
			flash[:alert] = "You forgot to type a comment!"
		end
		item
	end
end