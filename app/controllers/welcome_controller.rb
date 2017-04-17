class WelcomeController < ApplicationController
    def home
        if session[:user_id]
            redirect_to user_path(session[:user_id])
        else
            redirect_to signin_path
        end
    end
end