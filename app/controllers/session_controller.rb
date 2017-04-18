class SessionController < ApplicationController
    def new
    end
    def create
#        raise params.inspect
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            flash[:success] = "Successfully logged in!"
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            flash[:danger] = "Could not log in"
            render :new 
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
    
    private
    def session_params
        params.permit(:email, :password)
    end
end
