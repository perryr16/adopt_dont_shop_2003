require 'rails_helper'

RSpec.describe "Pets can be seen on index ", type: :feature do
  it "can view a pet" do
    pet1 = Pet.create(
      name: "Walter",
      age: "4",
      sex: "male",
      shelter: "the lab"


    )

    visit "/shelters"

    expect(page).to have_content("figaro figaro figaro")

    click_button "delete_button"
    expect(page).not_to have_content("figaro figaro figaro")
  end

end
