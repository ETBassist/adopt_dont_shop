class SheltersController < ApplicationController
  def index
    if params[:order] == "name"
      @shelters = Shelter.by_name
    elsif params[:order] == "adoptable_pets"
      @shelters = Shelter.by_num_adoptable_pets
    else
      @shelters = Shelter.all
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end
  
  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:new_name],
      address: params[:new_address],
      city: params[:new_city],
      state: params[:new_state],
      zip: params[:new_zip]
    })
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def pet_index
    @shelter = Shelter.find(params[:id])
    if params[:adoptable] == "true"
      @pets = @shelter.pets.adoptable_only
    else
      @pets = @shelter.pets.by_status
    end
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
