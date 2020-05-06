require 'rails_helper'

RSpec.describe "Pets can be seen on index ", type: :feature do
  it "can view a pet" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "666 dog Ave",
      city: "ruff town",
      state: "DG",
      zip: "12345"
    )
    pet1 = Pet.create(
      name: "Walter",
      age: "4",
      sex: "male",
      description: "a bit mischevious",

      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/sealyham-terrier-small-dog.jpg",
      shelter_id: shelter1.id
    )


    visit "/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter.name)

    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/sealyham-terrier-small-dog.jpg']")
  end

end
