require 'rails_helper'

RSpec.describe "pet show ", type: :feature do
  it "can show a pet" do

    pet1 = Pet.create(
      name: "Remy",
      age: "10",
      sex: "male",
      shelter: "the lab",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg"
    )
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )

    visit "/pets/#{pet1.id}"


    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")
    # expect(page).to have_link(nil, href: "/")
    # expect(page).to have_link(nil, href: "/shelters")
    # expect(page).to have_link(nil, href: "/shelters/new")
    # expect(page).to have_link(nil, href: "/pets")
    # expect(page).to have_link(nil, href: "/pets/new")
  end

end
