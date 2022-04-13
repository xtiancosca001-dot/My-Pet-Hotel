class PetsController < ApplicationController
    def index
        @owner = Owner.find_by(params[:owner_id])
        @pets = @owner.pets
    end
    
    def create
        @owner = Owner.find_by(params[:owner_id])
        @pet = @owner.create(pet_params)
        redirect_to owner_path(@owner)
    end

    def show
        @owner = Owner.find_by(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
    end

    def update
        @owner = Owner.find_by(params[:owner_id])
        @pet = @owner.find(params[:id])
        if @pet.update(req_params)
            redirect_to @pet
        else
            render :create, status: :unprocessable_entity
        end
    end
    

    def destroy
        @owner = Owner.find_by(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
        @pet.destroy
        redirect_to owner_path(@owner), status: 303
    end
    

    private
        def pet_params
            params.require(:pet).permit(:name, :pet_type, :status)
        end
end
