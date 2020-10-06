require 'rails_helper'

RSpec.describe "it can show and index of pets", type: :feature do 
  it "can show all pets in the system" do
    pet = Pet.create!({
      image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
      name: "Fluffy boi",
      approximate_age: 1,
      sex: "Male",
      sheltered_at: "Happy Shelter"
    })

    visit '/pets'
    find("img[src='https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg']")
    expect(page).to have_content("Fluffy boi")
    expect(page).to have_content("1")
    expect(page).to have_content("Male")
    expect(page).to have_content("Happy Shelter")
  end
end
