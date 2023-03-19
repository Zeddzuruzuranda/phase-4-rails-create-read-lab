class PlantsController < ApplicationController
    def index
        render json: Plant.all
    end
    def show
        plants = Plant.find(params[:id])
        
        if plants
            render json: plants
        else
            render json: {error: 'plants not found'}, status: :not_found
        end
    end
    def create
        plants = Plant.create(plants_params)
        if plants
            render json: plants, status: :created
            else
                render json: {error: 'plant not created'}
            end
    end


    private
    def plants_params
        params.permit([:name, :image, :price])
    end
    
end
