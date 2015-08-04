class CommentsController < ApplicationController
	def create
		@post = PostItem.find(params[:post_item_id])
		@post.blog_item.comments << Comment.create(author: params[:author], body: params[:body])
		redirect_to @post, notice: "Comment successfully added."
	end
end