class PetsController < ApplicationController
    def index
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.all
    end

    def new
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pet.new
    end
    
    def create
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.create(pet_params)
        if @pet.save
            flash[:success] = "Object was successfully updated"
            redirect_to owners_path
        else
            flash[:error] = "Something went wrong"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
    end

    def update
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
        if @pet.update(pet_params)
          flash[:success] = "Object was successfully updated"
          redirect_to owners_path
        else
          flash[:error] = "Something went wrong"
          render :new, status: :unprocessable_entity
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
