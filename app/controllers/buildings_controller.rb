class BuildingsController < ApplicationController
    
    def index
        @buildings = Building.all

        render json: @notes, status: 200
    end 
    
    
    #def index
      #  @buildings = Building.all
       # @user_buildings = current_user.buildings
    # end

    def new
        @building = Building.new
    end

    def create 
        @building = Building.create(building_params)

        render json: @building, status: 200 
    end 

    def update
        

    end 
    
    
    
    #def create 
           # @building = current_user.buildings.build(building_params)
        #if  @building.save
             #   flash[:success] = "Building Successfully Created!"
              #  redirect_to building_path(@building)
        #else 
           # render :new
        #end 
    #end 

    def show 
        @building = Building.find(params[:id])
        render json: @building, status: 200
        #@user_products = @building.products.ordered
    end 

    private 
    def building_params
        params.require(:building).permit(:name)
    end 

    
   
  
end