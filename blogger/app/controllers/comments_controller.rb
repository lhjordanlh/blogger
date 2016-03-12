class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.save
		flash.notice = "Congrat! Comment by '#{@comment.author_name}' is created!"
		redirect_to article_path(@comment.article)
	end

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end
