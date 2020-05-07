require 'rails_helper'

RSpec.describe "Pets can be seen on shelter pet ", type: :feature do
  it "can view a pet on shelter pet page" do

    shelter1 = Shelter.create(
      name: "Yarn Care",
      address: "666 cat Ave",
      city: "fluff town",
      state: "CT",
      zip: "12345"
    )

    shelter2 = Shelter.create(
      name: "Barks and Crafts",
      address: "999 woof Ave",
      city: "Ruff town",
      state: "DG",
      zip: "67890"
    )

    pet1 = Pet.create(
      name: "Walter",
      age: "4",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/sealyham-terrier-small-dog.jpg",
      adoptable: true,
      shelter_id: shelter2.id
    )
    pet2 = Pet.create(
      name: "Harry",
      age: "14",
      sex: "female",

      image: "https://cf.ltkcdn.net/cats/images/std/200777-425x322-kitten_crop.jpg",
      adoptable: true,
      shelter_id: shelter1.id
    )
    pet3 = Pet.create(
      name: "Penny",
      age: "17",
      sex: "female",

      image: "https://ichef.bbci.co.uk/news/976/cpsprodpb/16B90/production/_107427039_gettyimages-636475496.jpg",
      adoptable: false,
      shelter_id: shelter1.id
    )
    pet4 = Pet.create(
      name: "sebastian",
      age: "100",
      sex: "male",

      image: "https://ichef.bbci.co.uk/news/976/cpsprodpb/16B90/production/_107427039_gettyimages-636475496.jpg",
      adoptable: true,
      shelter_id: shelter2.id
    )



    visit "/shelters/#{shelter2.id}/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/sealyham-terrier-small-dog.jpg']")

    expect(page).not_to have_content(pet2.name)
    expect(page).not_to have_content(pet2.age)
    expect(page).not_to have_css("img[src*='https://cf.ltkcdn.net/cats/images/std/200777-425x322-kitten_crop.jpg']")

    expect(page).not_to have_content(pet3.name)
    expect(page).not_to have_content(pet3.age)
    expect(page).not_to have_content(pet3.sex)

    expect(page).to have_content(pet4.name)
    expect(page).to have_content(pet4.age)
    expect(page).to have_content(pet4.sex)
    expect(page).to have_css("img[src*='https://ichef.bbci.co.uk/news/976/cpsprodpb/16B90/production/_107427039_gettyimages-636475496.jpg']")

  end

end
