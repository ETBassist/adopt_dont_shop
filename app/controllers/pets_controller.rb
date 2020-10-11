require './lib/assets/null_adoption'
require './lib/assets/pending_adoption'

class PetsController < ApplicationController
  def index
    @pets = Pet.by_status
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      adoption_status: NullAdoption.new
    })
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy 
    redirect_to '/pets'
  end

  def change_status_to_pending
    pet = Pet.find(params[:id])
    pet.update({
      adoption_status: PendingAdoption.new
    })
    redirect_to "/pets/#{pet.id}"
  end

  def change_status_to_adoptable
    pet = Pet.find(params[:id])
    pet.update({
      adoption_status: NullAdoption.new
    })
    redirect_to "/pets/#{pet.id}"
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex)
  end
end
