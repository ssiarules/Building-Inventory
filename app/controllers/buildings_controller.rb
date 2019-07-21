class BuildingsController < ApplicationController
    
    def index
        @buildings = Building.all
        @user_buildings = current_user.buildings
        #binding.pry
    end

    def new
        @building = Building.new
    end

    def create 
            @building = current_user.buildings.build(building_params)
        #binding.pry
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
    end 

    def building_params
        params.require(:building).permit(:name)
    end 
  
end
    
     
    
    

    #def new 
        # if params[:product_id] && @product = Product.find_by_id(params[:product_id])
            #binding.pry
           # @building = @product.buildings.build(building_params)#has_many
           
       # else
           # @building = Building.new
           # @building.build_product #belongs_to - nested form
    #end 
#end
    
    #def create 
        #if params[:product_id] && @product = Product.find_by_id(params[:product_id])
           # @building = @product.buildings.build(building_params)
          # else
          #  @building = Building.new(building_params)
          # end
          #if @building.save
           # redirect_to building_path(@building)
          # else
           # render :new
          # end
       # end


  
