class SessionController < ApplicationController
    def new
    end
    def create
#        raise params.inspect
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
                    
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
        params.permit(:email, :password)
    end
end
