class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
    def current_user
        User.find(session[:user_id]) if session[:user_id] 
    end
    
    def user_not_authorized
        flash[:alert] = "Access denied." 
        redirect_to(request.referrer || root_path)
    end
end
