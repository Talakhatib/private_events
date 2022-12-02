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
            flash[:success]="A new user was created !!"
            redirect_to @user
        else 
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        @users = User.where.not(id: @user.id)
        @categories = Category.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update

        @user = User.find(params[:id])

        if @user.update(user_params)
            flash[:success] = "User Information Was Successfuly Updated. Please Check Your Email !!"
            UserMailer.user_updated_information(@user).deliver_now
            redirect_to @user
        else
           render :edit
        end

    end

    def information
        @user = User.find(params[:user])
    end

    private 
    def user_params 
        params.require(:user).permit(:name,:password,:password_confirmation,:email,:phone,:date_of_birth,:address)
    end
end
