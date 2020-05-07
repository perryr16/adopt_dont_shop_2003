require 'rails_helper'

RSpec.describe "Shleters edit page", type: :feature do
  it "can create a shelter" do

    visit "/shelters"

    expect(page).not_to have_content("Barks and Crafts")

    visit "/shelters/new"

    fill_in "name", with: "Barks and Crafts"
    fill_in "address", with: "123 Ruff St"
    fill_in "city", with: "Dog town"
    fill_in "state", with: "DG"
    fill_in "zip", with: "99999"
    click_on "Create Shelter"

    expect(page).to have_content("Barks and Crafts")

    click_link "Barks and Crafts"

    expect(page).to have_content("Name: Barks and Crafts")
    expect(page).to have_content("Address: 123 Ruff St")
    expect(page).to have_content("City: Dog town")
    expect(page).to have_content("State: DG")
    expect(page).to have_content("Zip: 99999")


  end
end
