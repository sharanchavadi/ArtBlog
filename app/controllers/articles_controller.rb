class ArticlesController < ApplicationController
   
   # this method is responsible for invoking ability.rb after before_action :authenticate_user! 

    load_and_authorize_resource
    
    def index
        @articles = Article.paginate(:page => params[:page], :per_page => 10)
    end

    def new
        @article = Article.new
        @category = Category.new
    end


    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id 
        
        if @article.save
            redirect_to article_path(@article.id), notice: "Successfully created #{@article.title}"
        else
            render action: "new"
        end
    end 


    def show
        begin
           @article = Article.find(params[:id])

           @comment = Comment.new 
        rescue ActiveRecord::RecordNotFound
           redirect_to articles_path, notice: "Record not found"
       end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        previous_name = @article.title
        if @article.update_attributes(article_params)
            redirect_to article_path(@article.id), notice: "Successfully updated"
        else
            render action: "edit"
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, notice: "Successfully deleted #{@article.title}"
    end

    private
  
    def article_params
       params[:article].permit(:title, :body, :category_id, :publish_date)
    end

end
