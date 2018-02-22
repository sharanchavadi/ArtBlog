class CategoriesController < ApplicationController
    before_action :authenticate_user!
    # this method is responsible for invoking ability.rb after before_action :authenticate_user! 

    load_and_authorize_resource
    
    def index
		@categories = Category.all
        @category = Category.new
	end

	def new
		@category = Category.new
	end

	def create
        incoming_controller = request.env["HTTP_REFERER"].scan(/articles/)
		@category = Category.new(category_params)
        respond_to do |format| 
    		if @category.save
    		  format.html {redirect_to categories_path, notice: "Successfully created #{@category.name}"} 
              format.js
    		  #format.js if incoming_controller.empty? 
              #format.js { render 'category_fly' if !incoming_controller.empty?} 
            else
    			format.html {render :new}
                format.js
    		end
        end
	end

    def show
        begin
           @category = Category.find(params[:id])
           @products = @category.articles
        rescue ActiveRecord::RecordNotFound
           redirect_to categories_path, notice: "Record not found"
       end
    end

    def edit
    	@category = Category.find(params[:id])
    end

    def update
    	@category = Category.find(params[:id])
    	previous_name = @category.name
    	if @category.update_attributes(params[:category].permit(:name))
    		redirect_to category_path(@category.id), notice: "Successfully updated from #{previous_name} to #{@category.name}"
    	else
    		render action: "edit"
    	end
    end
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, notice: "Successfully deleted #{@category.name}"
    end

    def category_params
        params[:category].permit(:name)
    end
end