class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    Pet.create({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter_id: params[:shelter_id],
      adoption_status: "adoptable"
    })
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      image: params[:new_image],
      name: params[:new_name],
      description: params[:new_description],
      approximate_age: params[:new_approximate_age],
      sex: params[:new_sex],
      shelter_id: params[:shelter_id],
      adoption_status: "adoptable"
    })
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy 
    redirect_to '/pets'
  end
end
