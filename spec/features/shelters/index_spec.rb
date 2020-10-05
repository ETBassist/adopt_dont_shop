require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  before :each do
    @shelter1 = Shelter.create!(name: 'SFSPCA')
    @shelter2 = Shelter.create!(name: 'Good pups be here')
  end

  it 'shows all shelters' do
    visit '/shelters'
    
    expect(page).to have_content('SFSPCA')
    expect(page).to have_content('Good pups be here')
  end
end
