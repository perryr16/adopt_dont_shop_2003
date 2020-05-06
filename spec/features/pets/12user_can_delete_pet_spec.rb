require 'rails_helper'

RSpec.describe "pet update ", type: :feature do
  it "can update a pet" do

    pet1 = Pet.create(
      name: "Remy",
      age: "10",
      sex: "male",
      shelter: "the lab",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg"
    )

    visit "/pets/#{pet1.id}"


    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")

    click_button("delete_button")


    expect(page).not_to have_content(pet1.name)
    expect(page).not_to have_content(pet1.age)
    expect(page).not_to have_content(pet1.sex)
    expect(page).not_to have_content(pet1.shelter)
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")


  end

end
