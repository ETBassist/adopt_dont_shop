require 'rails_helper'

describe Shelter, type: :model do
  describe "relationships" do
    it { should have_many :pets } 
  end

  it "should return shelters ordered by name" do
    shelter1 = Shelter.create!({name: "SFSPCA"})
    shelter2 = Shelter.create!({name: "All Pets Palace"})
    expected = [shelter1, shelter2]
    expect(Shelter.all).to eq(expected)

    expect(Shelter.by_name).to_not eq(expected)
    sorted = [shelter2, shelter1]
    expect(Shelter.by_name).to eq(sorted)
  end
end
