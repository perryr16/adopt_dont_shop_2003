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

    visit "/pets/#{pet1.id}/edit"

    fill_in "pet[name]", with: "Goose"
    fill_in "pet[description]", with: "hell of a wingman"
    fill_in "pet[image]", with: "https://ih1.redbubble.net/image.489763103.8167/flat,750x1000,075,f.u2.jpg"
    fill_in "pet[age]", with: "4"
    choose("female")
    fill_in "pet[shelter]", with:"Barks and Crafts"
    click_button "submit_button"

    click_link "Goose"


    expect(page).not_to have_content(pet1.name)
    expect(page).not_to have_content(pet1.age)
    # expect(page).not_to have_content(pet1.sex)
    expect(page).not_to have_content(pet1.shelter)
    expect(page).not_to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg']")

    expect(page).to have_content("Goose")
    expect(page).to have_content("hell of a wingman")
    expect(page).to have_content("4")
    expect(page).to have_content("female")
    expect(page).to have_content("Barks and Crafts")
    expect(page).to have_css("img[src*='https://ih1.redbubble.net/image.489763103.8167/flat,750x1000,075,f.u2.jpg']")


  end

end
