require 'rails_helper'

RSpec.describe "Create Pet", type: :feature do
  before :each do
    @shelter = Shelter.create!({
      name: "SFSPCA"
    })
  end

  it "has fields to fill in to create a pet" do
    visit "/shelters/#{@shelter.id}/pets"
    click_link("Create Pet")

    expect(current_path).to eq("/shelters/#{@shelter.id}/pets/new")
    expect(page).to have_field("image")
    expect(page).to have_field("name")
    expect(page).to have_field("description")
    expect(page).to have_field("approximate_age")
    expect(page).to have_field("sex")
  end

  it "can fill in the fields and create a pet" do
    visit "/shelters/#{@shelter.id}/pets/new"
    
    fill_in :image, with: "https://listproducer.com/wp-content/uploads/2014/10/cute.jpg"
    fill_in :name, with: "Penny"
    fill_in :description, with: "The cutest little kitten wearing the cutest little hat"
    fill_in :approximate_age, with: "2"
    select("Female", from: "sex").select_option
    click_button("Create Pet")

    expect(current_path).to eq("/shelters/#{@shelter.id}/pets")

    find("img[src='https://listproducer.com/wp-content/uploads/2014/10/cute.jpg']")
    expect(page).to have_content("Penny")
    expect(page).to have_content("2")
    expect(page).to have_content("Female")
  end

  it "has nav link to shelter index from new pets page" do
    visit "/shelters/#{@shelter.id}/pets/new"

    within('nav') do
      expect(page).to have_link("Shelters Index")
      click_link("Shelters Index")
      expect(current_path).to eq("/shelters")
    end
  end

  it "has nav link to pets index from new pets page" do
    visit "/shelters/#{@shelter.id}/pets/new"

    within('nav') do
      expect(page).to have_link("Pets Index")
      click_link("Pets Index")
      expect(current_path).to eq("/pets")
    end
  end
end
