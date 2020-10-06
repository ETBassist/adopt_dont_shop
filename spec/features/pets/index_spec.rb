require 'rails_helper'

RSpec.describe "pets index page", type: :feature do 
  before :each do
    @pet1 = Pet.create!({
      image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
      name: "Fluffy boi",
      approximate_age: 1,
      sex: "Male",
      sheltered_at: "Happy Shelter"
    })

    @pet2 = Pet.create!({
      image: "https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg",
      name: "Apollo Cat",
      approximate_age: 2,
      sex: "Female",
      sheltered_at: "SFSPCA"
    })
  end

  it "can show all pets in the system" do
    visit '/pets'
    find("img[src='https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg']")
    expect(page).to have_content("Fluffy boi")
    expect(page).to have_content("1")
    expect(page).to have_content("Male")
    expect(page).to have_content("Happy Shelter")
    find("img[src='https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg']")
    expect(page).to have_content("Apollo Cat")
    expect(page).to have_content("2")
    expect(page).to have_content("Female")
    expect(page).to have_content("SFSPCA")
  end
end
