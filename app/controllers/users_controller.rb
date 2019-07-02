class UsersController < ApplicationController
    
    def index 

    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id  #add user to the sessions so we can remember them when they go to the next page. 
            redirect_to user_path(@user)
        else  
            render :new 
        end 
    end 

    def show 
        @user = User.find_by(params[:id])
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end
