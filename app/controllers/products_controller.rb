class ProductsController < ApplicationController
    
    #def index 
        #if it's nested 
        #if params[:building_id] && @building = Building.find_by_id(params[:building_id])
            #@user_products = @building.products
            #load up only the buildings nested under that product 
        #else
            #go to next step
           # @products = Product.all
        #@product = current_user.products #View buildings current_user is assigned to.
    #end 
#end
    

  # def new 
         #if params[:building_id] && @building = Building.find_by_id(params[:building_id])
            #binding.pry
           # @product = @building.products.build(product_params)#has_many
           
        #else
         
           #@product = Product.new
            #@product.build_building #belongs_to - nested form
    #end 
#end

#def create 
        #if params[:building_id] && @building = Building.find_by_id(params[:building_id])
           #@product = @product.buildings.build(building_params)
           #else
            # @product = Product.new(product_params)
           #end
          
           #if @product.save
           # redirect_to product_path(@building)
           #else
            #render :new
           #end
        #end

    
    
    def index 
        @products = Product.all 
        @user_products = current_user.products
        #binding.pry
    end 

    def new 
        @product = Product.new
        @product.build_building #belongs_to relationship for the nested building in product form
    end 

    def create 
            @product = current_user.products.build(product_params)
        #binding.pry
         if  @product.valid?
                @product.save
                session[:product_id] = @product.id 
                redirect_to product_path(@product)
        else 
            render :show
        end 
     end 



def show 
    @product = Product.find(params[:id])
end 

    private 

    def product_params
        params.require(:product).permit(:name, :category, :description, :date_added, :building_id, building_attributes: [:name])
    end 
end
