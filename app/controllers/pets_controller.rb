class PetsController < ApplicationController
    def new
        @pet = Pet.new
    end

    def index
        if params[:owner_id]
            @owner = Owner.find(params[:owner_id])
            @pets = @owner.pets
        else 
            @pets = Pet.all
        end
    end
    
    def create
        if params[:owner_id]
            @owner = Owner.find(params[:owner_id])
            @pet = @owner.create(pet_params)
        else 
            @pet = Pet.create(pet_params)
        end
        redirect_to owner_path(@owner)
    end

    def show
        if params[:owner_id]
            @owner = Owner.find(params[:owner_id])
            @pet = @owner.pets.find(params[:id])
        else 
            @pet = Pet.find(params[:id])
        end
        
    end

    def update
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.find(params[:id])
        if @pet.update(req_params)
            redirect_to @pet
        else
            render :create, status: :unprocessable_entity
        end
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
