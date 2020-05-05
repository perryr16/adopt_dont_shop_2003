require 'rails_helper'

RSpec.describe "Shleters edit page", type: :feature do
  it "can edit a shelter's info" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )

    visit "/shelters/#{shelter1.id}/edit"
    # save_and_open_page
    fill_in "shelter[name]", with: "Border Collie Lands"
    fill_in "shelter[address]", with: "222 pup place"
    fill_in "shelter[city]", with: "newfoundland"
    fill_in "shelter[state]", with: "BO"
    fill_in "shelter[zip]", with: "99999"
    click_button "submit_button"

    expect(page).to have_content("Name: Border Collie Lands")
    expect(page).to have_content("Address: 222 pup place")
    expect(page).to have_content("City: newfoundland")
    expect(page).to have_content("State: BO")
    expect(page).to have_content("Zip: 99999")

  end
end
