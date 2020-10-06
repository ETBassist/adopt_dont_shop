require 'rails_helper'

RSpec.describe "shelter creation page", type: :feature do
  it "has fields to input new shelter information" do
    visit '/shelters/new'

    expect(page).to have_field('name')
    expect(page).to have_field('address')
    expect(page).to have_field('city')
    expect(page).to have_field('state')
    expect(page).to have_field('zip')
  end

  it "can create a new shelter" do
    visit '/shelters/new'

    fill_in :name, with: "Happy pet house"
    fill_in :address, with: "123 The Pets Lane"
    fill_in :city, with: "Magical pet palace"
    fill_in :state, with: "Bliss"
    fill_in :zip, with: "00100"
    click_button("Create Shelter")

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Happy pet house")
    click_link("Happy pet house")
    expect(page).to have_content("123 The Pets Lane")
    expect(page).to have_content("Magical pet palace")
    expect(page).to have_content("Bliss")
    expect(page).to have_content("00100")
  end
end
