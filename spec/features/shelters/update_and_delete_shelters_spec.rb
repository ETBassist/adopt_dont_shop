require 'rails_helper'

RSpec.describe "It can update and delete shelters", type: :feature do
  before :each do
    @shelter = Shelter.create!({
      name: "Happy Pastures Shelter",
      address: "The happiest place in the world",
      city: "Over the Rainbow",
      state: "CA",
      zip: "12345"
    })
  end

  it "can visit a page to update a shelter" do
    visit "/shelters/#{@shelter.id}/edit"

    expect(page).to have_field('new_name', with: @shelter.name)
    expect(page).to have_field('new_address', with: @shelter.address)
    expect(page).to have_field('new_city', with: @shelter.city)
    expect(page).to have_field('new_state', with: @shelter.state)
    expect(page).to have_field('new_zip', with: @shelter.zip)
  end

  it "can update the details for a shelter" do
    visit "/shelters/#{@shelter.id}/edit"
    page.fill_in 'new_name', with: 'Place of Pastural Happyness'

    click_button('Update')
    expect(current_path).to eq("/shelters/#{@shelter.id}")
    expect(page).to have_content('Place of Pastural Happyness')
    expect(page).to have_content('12345')
  end
end
