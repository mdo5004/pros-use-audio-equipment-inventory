class SessionController < ApplicationController
    def new
        
    end
    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(password: session_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            render :new, :alert => "Could not log in"
        end
    end
    
    def destroy
        session[:user_id] = nil
    end
    
    private
    def session_params
        params.require(:session).permit(:email, :password)
    end
end
