require 'rails_helper'

RSpec.describe "show shelter page", type: :feature do
  it "shows a shelter's details" do
    shelter = Shelter.create!(name: "SFSPCA", address: "250 Florida St", city: "SF", state: "CA", zip: "94103") 

    visit "/shelters/#{shelter.id}"

    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.address)
    expect(page).to have_content(shelter.city)
    expect(page).to have_content(shelter.state)
    expect(page).to have_content(shelter.zip)
  end

  it "has a nav link to the shelters index" do
    shelter = Shelter.create!(name: "SFSPCA", address: "250 Florida St", city: "SF", state: "CA", zip: "94103") 
    visit "/shelters/#{shelter.id}"

    within('nav') do
      expect(page).to have_link("Shelters Index")
      click_link("Shelters Index")
      expect(current_path).to eq("/shelters")
    end
  end

  it "has a nav link to the shelters index" do
    shelter = Shelter.create!(name: "SFSPCA", address: "250 Florida St", city: "SF", state: "CA", zip: "94103") 
    visit "/shelters/#{shelter.id}"

    within('nav') do
      expect(page).to have_link("Pets Index")
      click_link("Pets Index")
      expect(current_path).to eq("/pets")
    end
  end
end
