class CommentsController < ApplicationController
    
    # this method is responsible for invoking ability.rb after before_action :authenticate_user! 

	load_and_authorize_resource
	
	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@article = @comment.article
        if @comment.save 
			redirect_to :back, notice: "Thank you for the comment"
	    end

	end

    def show
        begin
           @comment = Comment.find(params[:id])
        rescue ActiveRecord::RecordNotFound
           redirect_to categories_path, notice: "Record not found"
       end
    end

    private 
    def comment_params
        params[:comment].permit(:title, :body, :article_id)
    end

end
