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
end
