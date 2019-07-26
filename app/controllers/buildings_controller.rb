class BuildingsController < ApplicationController
    
    def index
        @buildings = Building.all
        @user_buildings = current_user.buildings
        
    end

    def new
        @building = Building.new
    end

    def create 
            @building = current_user.buildings.build(building_params)
        if  @building.valid?
                @building.save
                flash[:success] = "Building Successfully Created!"
                session[:building_id] = @building.id 
                redirect_to building_path(@building)
        else 
            render :new
        end 
    end 

    def show 
        @building = Building.find(params[:id])
        @user_products = @building.products.ordered
    end 

    def building_params
        params.require(:building).permit(:name)
    end 
  
end