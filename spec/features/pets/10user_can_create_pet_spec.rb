require 'rails_helper'

RSpec.describe "pet create ", type: :feature do
  it "can create a pet" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )

    visit "/pets"

    expect(page).not_to have_content("Remy")
    expect(page).not_to have_content("Approximate age: 10")
    expect(page).not_to have_content("Sex: male")
    expect(page).not_to have_content("Name of shelter: the lab")
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")


    visit "/shelters/#{shelter1.id}/pets/new"

    fill_in "pet[name]", with: "Remy"
    fill_in "pet[age]", with: "10"
    choose("male")
    fill_in "pet[image]", with: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg"
    click_button "submit_button"

    # pet1 = Pet.create(
    #   name: "Remy",
    #   age: "10",
    #   sex: "male",
    #   image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
    #   shelter_id: shelter1.id
    # )
    expect(page).to have_content("Remy")
    expect(page).to have_content("10")
    expect(page).to have_content("male")
    expect(page).to have_content("the lab")
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")
    expect(page).to have_content("10")
  end

end
