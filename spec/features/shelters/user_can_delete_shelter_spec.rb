require 'rails_helper'

RSpec.describe "Shleters can be deleted ", type: :feature do
  it "can delete a shelter" do
    shelter1 = Shelter.create(
      name: "figaro figaro figaro",
      address: "123 the shop",
      city: "disney",
      state: "DI",
      zip: "33333"
    )

    visit "/shelters"

    expect(page).to have_content("figaro figaro figaro")

    click_button "delete_button"
    expect(page).not_to have_content("figaro figaro figaro")
  end

end
