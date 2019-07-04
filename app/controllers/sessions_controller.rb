class SessionsController < ApplicationController
    def index 

    end 

    def new 
    end 

    def create
      
    end 

    def destroy 
        session.clear #clear the session 
        redirect_to root_path #redirect the user back to the main page after logging out 
    end 

end
