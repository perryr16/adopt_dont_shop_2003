require 'rails_helper'

RSpec.describe "Shleter page", type: :feature do
  it "can see shelter name address city state and zip" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )
    shelter2 = Shelter.create(
      name: "starter kit-en",
      address: "999 Felix Ave",
      city: "Cat Alley",
      state: "CA",
      zip: "67890"
    )

    visit "/shelters/#{shelter1.id}"
    expect(page).to have_content("Name: #{shelter1.name}")
    expect(page).to have_content("Address: #{shelter1.address}")
    expect(page).to have_content("City: #{shelter1.city}")
    expect(page).to have_content("State: #{shelter1.state}")
    expect(page).to have_content("Zip: #{shelter1.zip}")


    visit "/shelters/#{shelter2.id}"
    expect(page).to have_content(shelter2.name)
    expect(page).to have_content("Address: #{shelter2.address}")
    expect(page).to have_content("City: #{shelter2.city}")
    expect(page).to have_content("State: #{shelter2.state}")
    expect(page).to have_content("Zip: #{shelter2.zip}")

  end
end
