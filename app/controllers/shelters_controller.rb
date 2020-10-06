class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
    })
    shelter.save
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
    shelter = Shelter.find(params[:id])
    shelter.destroy
    redirect_to '/shelters'
  end

  def pet_index
    @pets = Pet.where(shelter_id: params[:id])
  end
end
