require 'rails_helper'

RSpec.describe "pets index page", type: :feature do 
  before :each do
    @shelter = Shelter.create!({
      name: "SFSPCA"
    })

    @pet1 = Pet.create!({
      image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
      name: "Fluffy boi",
      approximate_age: 1,
      sex: "Male",
      shelter_id: @shelter.id
    })

    @pet2 = Pet.create!({
      image: "https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg",
      name: "Apollo Cat",
      approximate_age: 2,
      sex: "Female",
      shelter_id: @shelter.id
    })
  end

  it "can show all pets in the system" do
    visit '/pets'
    find("img[src='https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg']")
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@shelter.name)
    find("img[src='https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg']")
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.approximate_age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@shelter.name)
  end
end
