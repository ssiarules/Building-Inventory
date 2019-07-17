class ProductsController < ApplicationController
    def index 

    end 

    def new 
        @product = Product.new

    end 

    def create 
        @product = current_user.created_products.build(product_params)

            if @product.valid?
                @product.save
                session[:product_id] = @product.id 
                redirect_to product_path(@product)
            else 
            render :show

            end 
    end 

def show 
    @product = Product.find_by(id: params[:id])
end 

    private 

    def product_params
        params.require(:product).permit(:name, :category, :description, :building, :in_stock, :date_added)
    end 
end
