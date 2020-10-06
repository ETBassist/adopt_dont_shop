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
end
