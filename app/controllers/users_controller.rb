class UsersController < ApplicationController
    def index 
       @users = User.all 
       respond_to do |f|
        f.html {render :index} 
        f.json {render json: @users}
       end 
    end 

      
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params) #user_params is the info. user inputed. 
        if @user.save #if save fails it will return false, will only save if it is valid.
            session[:user_id] = @user.id   #add user to the sessions so we can remember them when they go to the next page. 
            respond_to do |format|
				format.html {redirect_to user_path(@user)}
                format.json {render json: @user}
            end 
        else
            render :new
        end 
    end 

    def show 
        @user = User.find(params[:id]) #if you don't include the first id: it will always return the first value user in the database created in your user/show page.  
        
        respond_to do |format|
            format.html {render :show, layout: false}
            format.json {render json: @users}   
          end
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end
