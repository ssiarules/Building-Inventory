class BuildingsController < ApplicationController
    def index 

    end 

    def new 
        @building = Building.new
    
    end 
    def create 
        @building = Building.new(building_params)
        binding.pry
            if @building.valid?
                @building.save
                session[:building_id] = @building.id 
                redirect_to products_new_path(@product)
            else 
            render :show
            #building_path(@building)
            end 
    end 


    def building_params
        params.require(:building).permit(:name)
    end 
  
end
