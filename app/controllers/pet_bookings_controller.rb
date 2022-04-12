class PetBookingsController < ApplicationController
    def new
        @owner = Owner.new
        @owner.pets.pet_bookings.build
    end
    
    def create
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
        @booking = @pet.pet_bookings.create(book_params)
        redirect_to owner_pet_path(@pet)
    end

    def destroy
        @owner = Owner.find(params[:owner_id])
        @pet = @owner.pets.find(params[:id])
        @booking = @pet.pet_bookings.find(params[:id])
        @booking.destroy 
        redirect_to owner_pet_path(@pet), status: 303
    end
    
    private
        def book_params
            params.require(:pet_booking).permit(:start_date, :end_date, :cage_num, :status)
        end
        
end
