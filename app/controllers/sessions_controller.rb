class SessionsController < ApplicationController

    def new
    end

    def create
        
    end

    def logout
        session.clear
        flash[:notice] = "See you soon!"
        redirect_to root_path
    end
    
end