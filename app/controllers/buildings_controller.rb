class BuildingsController < ApplicationController
    def index 
        #if it's nested 
        if params[:product_id] && @product = Product.find_by_id(params[:product_id])
            @buildings = @product.buildings
            #load up only the buildings nested under that product 
        else
            #go to next step
            @buildings = Buildings.all
       # @building = current_user.buildings #View buildings current_user is assigned to.
    end 
end

    def new 
         if params[:product_id] && @product = Product.find_by_id(params[:product_id])
            @buildings = @product.buildings.build #has_many
        else
            @building = Building.new
            @building.build_product #belongs_to - nested form
    end 
end
    
    def create 
        if params[:product_id] && @product = Workout.find_by_id(params[:product_id])
            @building = @product.buildings.build(building_params)
           else
            @building = Building.new(building_params)
           end
      
           if @building.save
            redirect_to building_path(@building)
           else
            render :new
           end
        end


    def building_params
        params.require(:building).permit(:name, :product_id, product_attributes: [:name, :category, :description, :date_added, :user_id, :building_id])
    end 
  
end
