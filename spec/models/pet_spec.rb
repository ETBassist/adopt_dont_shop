require 'rails_helper'
require './lib/assets/null_adoption'
require './lib/assets/pending_adoption'

describe Pet, type: :model do
  describe "Relationships" do
    it { should belong_to :shelter }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
  end

  it "can sort pets by adoption status" do
    shelter = Shelter.create!({name: "SFSPCA"})
    shelter2 = Shelter.create!({name: "The Other Place"})
    pet1 = shelter.pets.create!({name: "Benny",
                       adoption_status: PendingAdoption.new})
    pet2 = shelter.pets.create!({name: "Biggy",
                       adoption_status: NullAdoption.new})
    pet3 = shelter2.pets.create!({name: "Buggy",
                                  adoption_status: NullAdoption.new})
    original_order = [pet1, pet2, pet3]
    expect(Pet.all).to eq(original_order)

    ordered_by_status = [pet2, pet1]
    expect(shelter.pets.by_status).to eq(ordered_by_status)
  end
end
