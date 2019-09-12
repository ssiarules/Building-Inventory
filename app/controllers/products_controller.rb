class ProductsController < ApplicationController
    
    skip_before_action :verify_authenticity_token 
    #The authenticity token is designed so that you know your form is being submitted from your website. It is generated from the machine on which it runs with a unique identifier that only your machine can know, thus helping prevent cross-site request forgery attacks.

    def index 
        @products = Product.ordered
        @user_products = current_user.products.ordered 
    end 

    def new 
        @product = Product.new
        @product.build_building #belongs_to relationship for the nested building in product form
    end 

    def create 
        @product = current_user.products.build(product_params)
        if  @product.save
            flash[:success] = "Product Successfully Created!"
            redirect_to product_path(@product)
          else 
            render :show
        end 
        
    end 

    def show 
        @product = Product.find(params[:id])
        render json: @product, status: 200
    end 

    private 

    def product_params
        params.require(:product).permit(:name, :category, :description, :date_added, :building_product, :building_id, building_attributes: [:name])
    end 
end

    




    
    
   
