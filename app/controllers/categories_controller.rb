class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def create
        @user = User.find(params[:user_id])
        @category = @user.categories.build(category_params)
        if @category.save!
            flash[:success]="Category is successfuly added"
            redirect_to @user
        end
    end

    private 
    def category_params 
        params.require(:category).permit(:title)
    end
end
