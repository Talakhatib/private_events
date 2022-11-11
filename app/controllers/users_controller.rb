class UsersController < ApplicationController
    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)

        if @user.save 
            flash[:success]="A new user was created!!"
            redirect_to @user
        else 
            flash[:danger]="Failed to create a new user. Please try again ! "
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        @users = User.where.not(id: @user.id)
    end

    private 
    def user_params 
        params.require(:user).permit(:name)
    end
end
