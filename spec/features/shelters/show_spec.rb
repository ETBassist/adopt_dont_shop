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
end
