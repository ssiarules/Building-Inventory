class UsersController < ApplicationController
    def index 
    end 
    
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
       
        if @user.valid? #did if pass all the validations if so do this if not do the other 
            @user.save #if save fails it will return false, will only save if it is valid.
            session[:user_id] = @user.id  #add user to the sessions so we can remember them when they go to the next page. 
            redirect_to user_path(@user)
        else  
            render :new
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id]) #if you don't include the first id: it will always return the first value user in the database created in your user/show page.  
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end
