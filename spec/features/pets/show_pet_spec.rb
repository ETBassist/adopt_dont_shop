require 'rails_helper'

RSpec.describe "Pet Details", type: :feature do
  it "can show details about a specific pet" do
    shelter = Shelter.create!({
      name: "SFSPCA"
    })

    pet = Pet.create!({
      image: "https://static.boredpanda.com/blog/wp-content/uuuploads/cute-baby-animals/cute-baby-animals-10.jpg",
      name: "Ms. Piggy",
      approximate_age: 2,
      sex: "Female",
      shelter_id: shelter.id
    })

    visit "/pets/#{pet.id}"
    expect(page).to have_content("Ms. Piggy")
    expect(page).to have_content("2")
    expect(page).to have_content("Female")
  end
end
