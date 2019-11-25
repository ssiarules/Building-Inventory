class ProductsController < ApplicationController
    
    skip_before_action :verify_authenticity_token 
    #The authenticity token is designed so that you know your form is being submitted from your website. It is generated from the machine on which it runs with a unique identifier that only your machine can know, thus helping prevent cross-site request forgery attacks.
   

def index 

        @products = Product.ordered
        @user_products = current_user.products.ordered
        if params[:building_id]
        @building = Building.find_by(id: params[:building_id])
        @products = @building && @building.products
        if @products 
        respond_to do |format|
            format.html {} #render :index, layout: false
            format.json {render json: @products, each_serializer: ProductBuildingSerializer }
          end
          else
        @error = "Building not found!"
        respond_to do |format|
          format.html {}
          format.json { render json: {message: @error}, status: :not_found }
        end
      end
    else
      @products = Product.all 
      respond_to do |format|
        format.html {}
        format.json { render json: @products }
      end
    end
    
end 

def new 
        @product = Product.new
        @product.build_building #belongs_to relationship for the nested building in product form
        if params[:layout] == 'false' 
            render :new, layout: false 
        end 
 end 


    def create 
        @product = current_user.products.build(product_params)
        if  @product.save
            flash[:success] = "Product Successfully Created!"
            respond_to do |f|
               f.html {redirect_to @product}
                f.json {render json: @products}
        end 
          else 
            render :new
        end      
    end 

def show 
        @product = Product.find(params['id'])
        respond_to do |f|
			f.html {render :show }
			f.json {render json: @product }
		end
 end 


    def edit 
        @product = Product.find(params[:id])
        respond_to do |f|
            f.html {render :edit}
            f.json {render json: @product}
    end 
end 

    def update 
         @product = Product.find(params["id"])
            if @product.update(product_params)
        redirect_to product_path(@product)
    else 
            render :edit
    end 
end 

def destroy 
    @product = Product.find(params['id'])
    @product.destroy
    redirect_to products_path
end 

    private 

    def product_params
        params.require(:product).permit(:name, :category, :description, :date_added, :building_product, :building_id, building_attributes: [:name])
    end 

end 
 





    




    
    
   
