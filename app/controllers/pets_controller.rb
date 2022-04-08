class PetsController < ApplicationController
    def create
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.create(pet_params)
        redirect_to owner_path(@owner)
    end

    def show
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
    end
    

    def destroy
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
        @pet.destroy
        redirect_to owner_path(@owner), status: 303
    end
    

    private
        def pet_params
            params.require(:pet).permit(:name, :pet_type, :status)
        end
end
