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

  it 'has a nav link to itself' do
    visit '/shelters'

    expect(page).to have_link('Shelters Index')
    click_link('Shelters Index')

    expect(current_path).to eq('/shelters')
  end

  it 'has a nav link to the pets index page' do
    visit '/shelters'

    expect(page).to have_link('Pets Index')
    click_link('Pets Index')

    expect(current_path).to eq('/pets')
  end

  it 'has a link to oranize shelters by name' do
    visit '/shelters'

    expect(page).to have_link('See Shelters Ordered by Name')
    click_link('See Shelters Ordered by Name')
    page.body.should =~ /SFSPCA.*Good Pups be here/
  end
end
