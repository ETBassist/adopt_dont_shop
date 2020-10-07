require 'rails_helper'

RSpec.describe "Update and Delete Pets", type: :feature do
  before :each do
    @shelter = Shelter.create!({
      name: "SFSPCA"
    })

    @pet = Pet.create!({
      image: "https://listproducer.com/wp-content/uploads/2014/10/cute.jpg",
      name: "Penny",
      description: "The cutest little kittne wearing the cutest little hat",
      approximate_age: "2",
      sex: "Female",
      shelter_id: @shelter.id
    })
  end

  it "can visit an update page" do
    visit "/pets/#{@pet.id}"

    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{@pet.id}/edit")
    expect(page).to have_field("new_image", with: @pet.image)
    expect(page).to have_field("new_name", with: @pet.name)
    expect(page).to have_field("new_description", with: @pet.description)
    expect(page).to have_field("new_approximate_age", with: @pet.approximate_age)
    expect(page).to have_field("new_sex", with: @pet.sex)
  end
end
