class BuildingsController < ApplicationController
    def index 

    end 

    def new 
        @building = Building.new
    
    end 
    def create 
        @building = Building.new(building_params)

            if @building.valid?
                @building.save
                session[:building_id] = @building.id 
                redirect_to building_path(@building)
            else 
            render :show

            end 
    end 


    def building_params
        params.require(:building).permit(:name, :floor_num, :date, :user_id )
    end 
  
end
