require 'rails_helper'

RSpec.describe "It can update and delete shelters", type: :feature do
  before :each do
    @shelter = Shelter.create!({
      name: "Happy Pastures Shelter",
      address: "The happiest place in the world",
      city: "Over the Rainbow",
      zip: "12345"
    })
  end

  it "can visit a page to update a shelter" do
    visit "/shelters/#{@shelter.id}/edit"

    expect(page).to have_field(:new_name)
    expect(page).to have_field(:new_address)
    expect(page).to have_field(:new_city)
    expect(page).to have_field(:new_state)
    expect(page).to have_field(:new_zip)
  end
end
