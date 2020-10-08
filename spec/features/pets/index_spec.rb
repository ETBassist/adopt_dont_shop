require 'rails_helper'

RSpec.describe "pets index page", type: :feature do 
  before :each do
    @shelter1 = Shelter.create!({
      name: "SFSPCA"
    })

    @shelter2 = Shelter.create!({
      name: "Happy Furballs"
    })

    @pet1 = @shelter1.pets.create!({
      image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
      name: "Fluffy boi",
      approximate_age: 1,
      sex: "Male"
    })

    @pet2 = @shelter1.pets.create!({
      image: "https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg",
      name: "Apollo Cat",
      approximate_age: 2,
      sex: "Female"
    })

    @pet3 = @shelter2.pets.create!({
      image: "https://static.boredpanda.com/blog/wp-content/uuuploads/cute-baby-animals/cute-baby-animals-10.jpg",
      name: "Cute Piggledy",
      approximate_age: 5,
      sex: "Male"
    })
  end

  describe "All Pets Index" do
    it "can show all pets in the system" do
      visit '/pets'
      find("img[src='https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@shelter1.name)
      find("img[src='https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg']")
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet2.approximate_age)
      expect(page).to have_content(@pet2.sex)
      expect(page).to have_content(@shelter1.name)
    end

    it "has nav link to shelter index from pets index" do
      visit "/pets/"

      within('nav') do
        expect(page).to have_link("Shelters Index")
        click_link("Shelters Index")
        expect(current_path).to eq("/shelters")
      end
    end

    it "has navbar link to pet index from within pets index" do
      visit "/pets"

      within('nav') do
        expect(page).to have_link("Pets Index")
        click_link("Pets Index")
        expect(current_path).to eq("/pets")
      end
    end

    it "has a button to delete a pet from the pet index" do
      visit "/pets"

      expect(page).to have_button("Delete #{@pet1.name}")
      click_button("Delete #{@pet1.name}")
      expect(current_path).to eq("/pets")

      expect(page).to have_no_content("#{@pet1.name}")
    end

    it 'has a link to a pets show page' do
      visit '/pets'
      click_link("#{@pet3.name}")
      expect(current_path).to eq("/pets/#{@pet3.id}")
    end
  end

  describe "Shelters Pet Index" do
    it "can view pets at a specific shelter" do
      visit "/shelters/#{@shelter1.id}/pets"
      find("img[src='https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@shelter1.name)
      find("img[src='https://filmdaily.co/wp-content/uploads/2020/04/cute-cat-videos-lede-1300x882.jpg']")
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet2.approximate_age)
      expect(page).to have_content(@pet2.sex)

      expect(page).to have_no_content(@pet3.name)
      expect(page).to have_no_content(@pet3.approximate_age)
      expect(page).to have_no_content(@shelter2.name)
    end

    it "has a nav link to shelter index from shelters pets index" do
      visit "/shelters/#{@shelter1.id}/pets"

      within('nav') do
        expect(page).to have_link("Shelters Index")
        click_link("Shelters Index")
        expect(current_path).to eq("/shelters")
      end
    end

    it "has a nav link to shelter index from shelters pets index" do
      visit "/shelters/#{@shelter1.id}/pets"

      within('nav') do
        expect(page).to have_link("Pets Index")
        click_link("Pets Index")
        expect(current_path).to eq("/pets")
      end
    end

    it "has a button to delete a pet from the shelters pet index" do
      visit "/shelters/#{@shelter1.id}/pets"

      expect(page).to have_button("Delete #{@pet1.name}")
      click_button("Delete #{@pet1.name}")
      expect(current_path).to eq("/pets")

      expect(page).to have_no_content("#{@pet1.name}")
    end
  end
end
