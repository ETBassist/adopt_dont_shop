class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end
end
