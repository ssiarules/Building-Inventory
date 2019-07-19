class ProductsController < ApplicationController
    def index 

    end 

    def new 
        @product = Product.new
        @product.build_building #belongs_to relationship for the nested building in product form

    end 

    def create 
        @product = current_user.products.new(product_params)
        binding.pry
            if @product.valid?
                @product.save
                session[:product_id] = @product.id 
                redirect_to product_path(@product)
            else 
            render :show

            end 
    end 

#def show 
   #@product = Product.find_by(id: params[:id])
#end 

def show 
    @product = Product.find(params[:id])
end 

    private 

    def product_params
        params.require(:product).permit(:name, :category, :description, :date_added, :building_id, building_attributes: [:name])
    end 
end
