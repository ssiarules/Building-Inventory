class SessionsController < ApplicationController
    def index 

    end 

    def new 
    end 

    def create
        #find the user 
       @user = User.find_by(username: params[:user][:username]) 

       #if we find something & they have the right password
       if @user && @user.authenticate(params[:user][:username])
            sessions[:user_id] = @user.id #keep tracks of user sessions through pages.
            redirect_to user_path(@user) #redirect to another path
        else
            flash[:message] = "Wrong! Please Try Again!" #alert 
            redirect_to login_path #always have a redirect for flash
       end  
    end 

    def destroy 
        session.clear #clear the session 
        redirect_to root_path #redirect the user back to the main page after logging out 
    end 

end
