class OwnersController < ApplicationController
    def index
        # needs template
        @owners = Owner.all
    end
    
    # Create an Owner
    def new
        # Needs A Template
        @owner = Owner.new
    end

    def create
        # Creates an instance and redirects
        @owner = Owner.new(req_params)
        if @owner.save
            redirect_to owners_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    # Show an Onwer
    def show
        @owner = Owner.find(params[:id])
    end
    

    # Edit an Owner
    def edit
        @owner = Owner.find(params[:id])
    end

    def update
        @owner = Owner.find(params[:id])
        if @owner.update(req_params)
            redirect_to owners_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    # Delete an Owner
    def destroy
        @owner = Owner.find(params[:id])
        @owner.destroy
        redirect_to owners_path, status: :see_other
    end
    
    
    private
        def req_params
            params.require(:owner).permit(:name, :tel_num, :status)
        end
end
