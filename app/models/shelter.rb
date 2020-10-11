class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  def self.by_name
    Shelter.order(:name)
  end

  def self.by_num_adoptable_pets
    shelters = Shelter.all
    shelters.sort_by do |shelter|
      shelter.pets.count do |pet|
        pet.adoption_status.current_status == "Adoptable"
      end
    end.reverse
  end
end
