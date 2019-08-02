class SessionsController < ApplicationController
    def index 

    end 

    def new 
     
    end 
    

    def create
       
       @user = User.find_by(username: params[:user][:username]) 

       #if we find something & they have the right password
       if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id #keep tracks of user sessions through pages.
            redirect_to user_path(@user) #redirect to another path
        else
            flash[:message] = "Wrong! Please Try Again!" #alert 
            redirect_to login_path #always have a redirect for flash
       end  
    end 


    def omniauth_create
        @user = User.find_or_create_by(uid: auth['uid']) do |u| # finding a user already log into facebook or creating a new user
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid'] #secure random Hex
          end
       
          session[:user_id] = @user.id #log user in
       
          redirect_to products_new_path
        end

    def destroy 
        session.clear #clear the session 
        redirect_to root_path #redirect the user back to the main page after logging out 
    end 

    private

    def auth
    request.env['omniauth.auth']
    end
    #The private method is essentially bringing in the callback request, so it's going to contain 
        #all the information about the callback request and we'll just access it using auth

end
