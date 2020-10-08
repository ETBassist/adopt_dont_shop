require 'rails_helper'

RSpec.describe "Pet Details", type: :feature do
  before :each do
    shelter = Shelter.create!({
      name: "SFSPCA"
    })

    @pet = Pet.create!({
      image: "https://static.boredpanda.com/blog/wp-content/uuuploads/cute-baby-animals/cute-baby-animals-10.jpg",
      name: "Ms. Piggy",
      description: "The cutest piggy you ever did see, what an adorable little snout!",
      approximate_age: 2,
      sex: "Female",
      shelter_id: shelter.id,
      adoption_status: "Adoptable"
    })
  end

  it "can show details about a specific pet" do
    visit "/pets/#{@pet.id}"
    expect(page).to have_content(@pet.name)
    expect(page).to have_content(@pet.description)
    expect(page).to have_content(@pet.approximate_age)
    expect(page).to have_content(@pet.sex)
    expect(page).to have_content(@pet.adoption_status)
  end

  it 'has a link in the nav bar to the shelters index page' do
    visit "/pets/#{@pet.id}"
    expect(page).to have_link('Shelters Index')

    click_link('Shelters Index')
    expect(current_path).to eq('/shelters')
  end
end
