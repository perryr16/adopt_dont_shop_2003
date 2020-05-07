require 'rails_helper'

RSpec.describe "pet update ", type: :feature do
  it "can delete a pet from show" do

    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )
    pet1 = Pet.create(
      name: "Remy",
      age: "1999",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id
    )

    visit "/pets/#{pet1.id}"


    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.shelter.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")
    expect(page).to have_content(pet1.adoption_status)
    click_button("Delete #{pet1.name}")

    expect(page).not_to have_content(pet1.name)
    expect(page).not_to have_content(pet1.age)
    # expect(page).not_to have_content(pet1.sex)
    # expect(page).not_to have_content(pet1.shelter)
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")

  end

  it "can delete pets from shelter pet index" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )
    pet1 = Pet.create(
      name: "Remy",
      age: "2999",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id
    )

    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.shelter.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")
    click_button("Delete #{pet1.name}")

    expect(page).not_to have_content(pet1.name)
    expect(page).not_to have_content(pet1.age)
    # expect(page).not_to have_content(pet1.sex)
    expect(page).not_to have_content(pet1.shelter)
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")

  end

  it "can delete pets from pet index" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )
    pet1 = Pet.create(
      name: "Remy",
      age: "3999",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id
    )

    visit "/pets"


    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.shelter.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")
    click_button("Delete #{pet1.name}")

    expect(page).not_to have_content(pet1.name)
    expect(page).not_to have_content(pet1.age)
    # expect(page).not_to have_content(pet1.sex)
    expect(page).not_to have_content(pet1.shelter)
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")

  end

end
