class BuildingsController < ApplicationController
    
    def index 
        @buildings = Building.ordered
        @user_buildings = current_user.buildings.ordered
    end 
   
   
    #def index
       # @buildings = Building.all
        #respond_to do |format|
          #  format.html {render :index, layout: false}
         #   format.json {render json: @posts}
         # end
    #end 
    
    
    #def index
      #  @buildings = Building.all
       # @user_buildings = current_user.buildings
    # end

    def new
        @building = Building.new
        respond_to do |format|
            format.html {render :index, layout: false}
            format.json {render json: @buildings}
          end
    end

    #def create 
       # @building = Building.create(building_params)
       # respond_to do |format|
         #   format.html {render :index, layout: false}
          #format.json {render json: @buildings}
          #end

       # render json: @building, status: 200 
   # end 

    def update

        respond_to do |format|
            format.html {render :index, layout: false}
            format.json {render json: @buildings}
          end


    end 
    
    
    
    def create 
            @user_building = current_user.buildings.build(building_params)
        if  @building.save
             flash[:success] = "Building Successfully Created!"
              redirect_to building_path(@building)
        else 
            render :new
        end 
    end 

    def create 
        @product = current_user.products.build(product_params)
        if  @product.save
            respond_to do |f|
                f.html {redirect_to products_path}
                f.json {render json: @products}
            end 
            flash[:success] = "Product Successfully Created!"
            #redirect_to product_path(@product)
          else 
            render :show
        end      
    end



    def show 
        @building = Building.find(params[:id])
        render json: @building, status: 200
    end 
    
    private 
    def building_params
        params.require(:building).permit(:name)
    end 

    
   
  
end