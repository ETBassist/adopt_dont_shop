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
    
    @pet2 = Pet.create!({
      image: "https://listproducer.com/wp-content/uploads/2014/10/cute.jpg",
      name: "Fluffy",
      description: "Just the tiniest ball of fluffy",
      approximate_age: "5",
      sex: "Male",
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

  it "can update a pet" do
    visit "pets/#{@pet.id}/edit"

    fill_in :new_name, with: "Snickerdoodle"
    fill_in :new_description, with: "A most adorable kitten, still wearing a hat but now also staring deeply into your soul"
    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{@pet.id}")
    expect(page).to have_content("Snickerdoodle")
    expect(page).to have_content("A most adorable kitten, still wearing a hat but now also staring deeply into your soul")
  end
  
  it "can delete a pet" do
    visit "pets/#{@pet.id}"

    click_button "Delete Pet"
    expect(current_path).to eq("/pets")

    expect(page).to have_no_content("Penny")
    expect(page).to have_no_content("The cutest little kittne wearing the cutest little hat")
    expect(page).to have_no_content("2")
    expect(page).to have_no_content("Female")
  end

  it "has navbar link to shelter index" do
    visit "/pets/#{@pet.id}/edit"

    within('nav') do
      expect(page).to have_link("Shelters Index")
      click_link("Shelters Index")
      expect(current_path).to eq("/shelters")
    end
  end

  it "has navbar link to pet index" do
    visit "/pets/#{@pet.id}/edit"

    within('nav') do
      expect(page).to have_link("Pets Index")
      click_link("Pets Index")
      expect(current_path).to eq("/pets")
    end
  end
end
