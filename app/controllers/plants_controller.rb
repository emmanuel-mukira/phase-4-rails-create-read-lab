class PlantsController < ApplicationController
    def index 
     plants=Plant.all 
     render json:plants
    end

    def show 
     plants=Plant.find(params[:id])
     if plants 
        render json: plants 
     else 
        render json: { error: "Plant not found" }, status: :not_found
        
     end
    end

    def create 
     plants=Plant.create(plants_params)
     render json: plants , status: :created
    end

    private 
    def plants_params 
        params.permit(:name , :image , :price)
    end

end
