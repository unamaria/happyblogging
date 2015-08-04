class CommentsController < ApplicationController
	def create
		@post = PostItem.find(params[:post_item_id])
		@post.blog_item.comments << Comment.create!(author: params[:comment][:author], body: params[:comment][:body])
		redirect_to user_post_item_path(@post.author.handle, @post), notice: "Comment successfully added."
	end
end