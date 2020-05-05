require 'rails_helper'

RSpec.describe "pet create ", type: :feature do
  it "can create a pet" do


    visit "/pets"

    expect(page).not_to have_content("Remy")
    expect(page).not_to have_content("Approximate age: 10")
    expect(page).not_to have_content("Sex: male")
    expect(page).not_to have_content("Name of shelter: the lab")
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")


    visit "/pets/new"

    fill_in "pet[name]", with: "Remy"
    fill_in "pet[age]", with: "10"
    choose("male")
    fill_in "pet[shelter]", with: "the lab"
    fill_in "pet[image]", with: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg"
    click_button ""

    pet1 = Pet.create(
      name: "Remy",
      age: "10",
      sex: "male",
      shelter: "the lab",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg"
    )

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")
  end

end
