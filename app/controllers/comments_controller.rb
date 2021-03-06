class CommentsController < ApplicationController
	before_action :authenticate_user!
	

	def index
		@comments = Comment.all
	end

	def new
		@comment = @commentable.comments.new
	end

	def create
		@comment = @commentable.comments.new(comment_params)
		if @comment.save
		  flash[:success] = 'El comentario ha sido registrado con éxito.'
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

		
end