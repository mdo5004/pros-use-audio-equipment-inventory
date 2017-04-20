class UsersController < ApplicationController

    def new
        @user = User.new
        authorize @user
    end
    def create
        @user = User.new(user_params)
        authorize @user
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
        end
    end
    def edit
        @user = User.find(params[:id])
        authorize @user
    end
    def update
        @user = User.find(params[:id])
        @user.authenticate(password: user_params[:old_password])
        authorize @user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
    def show
        @user = User.find(params[:id])
        authorize @user
    end
    
    def index
        @users = User.all
        authorize @users
    end
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :title, :location)
    end
    def old_password
        params.permit(:old_password) 
    end
end
