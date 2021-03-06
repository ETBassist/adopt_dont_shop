require 'rails_helper'
require './lib/assets/null_adoption'
require './lib/assets/pending_adoption'

describe Pet, type: :model do
  describe "Relationships" do
    it { should belong_to :shelter }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :adoption_status }
  end

  before :each do
    @shelter = Shelter.create!({name: "SFSPCA"})
    @shelter2 = Shelter.create!({name: "The Other Place"})
    @pet1 = @shelter.pets.create!({name: "Benny",
                       adoption_status: PendingAdoption.new})
    @pet2 = @shelter.pets.create!({name: "Biggy",
                       adoption_status: NullAdoption.new})
    @pet3 = @shelter2.pets.create!({name: "Buggy",
                                  adoption_status: NullAdoption.new})
  end

  it "can sort pets by adoption status" do
    original_order = [@pet1, @pet2, @pet3]
    expect(Pet.all).to eq(original_order)

    ordered_by_status = [@pet2, @pet1]
    expect(@shelter.pets.by_status).to eq(ordered_by_status)
  end

  it "can get only pets that are adoptable" do
    expect(Pet.adoptable_only).to eq([@pet2, @pet3])
  end

  it "can get only pets with pending adoptions" do
    expect(Pet.pending_only).to eq([@pet1])
  end
end
