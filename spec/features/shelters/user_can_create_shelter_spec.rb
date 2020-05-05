require 'rails_helper'

RSpec.describe "Shleters edit page", type: :feature do
  it "can create a shelter" do

    visit "/shelters"

    expect(page).not_to have_content("figaro figaro figaro")
    visit "/shelters/new"


    fill_in "shelter[name]", with: "figaro figaro figaro"
    fill_in "shelter[address]", with: "123 the shop"
    fill_in "shelter[city]", with: "disney"
    fill_in "shelter[state]", with: "DI"
    fill_in "shelter[zip]", with: "33333"
    click_button "submit_button"

    shelter1 = Shelter.create(
      name: "figaro figaro figaro",
      address: "123 the shop",
      city: "disney",
      state: "DI",
      zip: "33333"
    )

    expect(page).to have_content(shelter1.name)

    click_link "#{shelter1.name}"

    expect(page).to have_content("Name: #{shelter1.name}")
    expect(page).to have_content("Address: #{shelter1.address}")
    expect(page).to have_content("City: #{shelter1.city}")
    expect(page).to have_content("State: #{shelter1.state}")
    expect(page).to have_content("Zip: #{shelter1.zip}")


  end
end
