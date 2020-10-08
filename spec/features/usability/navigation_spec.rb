require 'rails_helper'

describe "User can navigate page using links" do
  before :each do
    @shelter = Shelter.create!({
      name: "SFSPCA"
    })

    @pet = Pet.create!({
      image: "https://static.boredpanda.com/blog/wp-content/uuuploads/cute-baby-animals/cute-baby-animals-10.jpg",
      name: "Ms. Piggy",
      description: "The cutest piggy you ever did see, what an adorable little snout!",
      approximate_age: 2,
      sex: "Female",
      shelter_id: @shelter.id,
      adoption_status: "Adoptable"
    })
  end

  it "can visit link to edit shelter info from shelter index" do
    visit '/shelters'

    expect(page).to have_link("Edit Info for #{@shelter.name}")
    click_link("Edit Info for #{@shelter.name}")

    expect(current_path).to eq("/shelters/#{@shelter.id}/edit")
  end

  it "can delete a shelter from the index by clicking a link" do
    visit '/shelters'

    expect(page).to have_button("Delete #{@shelter.name}")
    click_button("Delete #{@shelter.name}")
    
    expect(current_path).to eq('/shelters')

    expect(page).to have_no_content(@shelter.name)
  end

  it "can edit a pet from the pets index page" do
    visit '/pets'

    expect(page).to have_link("Edit Info for #{@pet.name}")
    click_link("Edit Info for #{@pet.name}")
    
    expect(current_path).to eq("/pets/#{@pet.id}/edit")
  end

  it "can edit a pet from the pets index page" do
    visit "/shelters/#{@shelter.id}/pets"

    expect(page).to have_link("Edit Info for #{@pet.name}")
    click_link("Edit Info for #{@pet.name}")
    
    expect(current_path).to eq("/pets/#{@pet.id}/edit")
  end
end
