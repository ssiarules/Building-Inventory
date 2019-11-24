class BuildingsController < ApplicationController
    
    def index 
        @buildings = Building.ordered
        @user_buildings = current_user.buildings.ordered
        respond_to do |format|
            format.html {render :index, layout: false}
            format.json {render json: @buildings, each_serializer: BuildingSerializer}
          end
    end 

    def new
        @building = Building.new
        
    end


    def create 
            @building = current_user.buildings.build(building_params)
        if  @building.save
             flash[:success] = "Building Successfully Created!"
             respond_to do |f|
                f.html {redirect_to building_path}
                f.json {render json: @buildings}
             end 
        else 
            render :new
        end 
    end 


    def edit 
        @building = Building.find(params["id"])
        respond_to do |f|
            f.html {render :edit}
            f.json {render json: @building}
    end 
end 

    def update 
         @building = Building.find(params["id"])
            if @building.update(building_params)
        redirect_to building_path(@building)
    else 
            render :edit
    end 
end 

def destroy 
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to buildings_path, notice: " Delete Success"
   
end 


def show 
    @building = Building.find_by(id: params[:id])
    redirect_to buildings_path unless @building
    respond_to do |f|
      f.html { render :show}
      f.json { render json: @building }
    end
  end


#def show 
   # @building = Building.find(params[:id])
    #respond_to do |f|
      # f.html {render :show, layout: false}
      # f.json {render json: @building }
    #end
#end 

    
    private 
    def building_params
        params.require(:building).permit(:name)
    end 
end