require 'rails_helper'

RSpec.describe "Shleters index page", type: :feature do
  it "can see shelter names" do
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

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end

  xit "can list shelters by alphabetical order" do
    shelter1 = Shelter.create(
      name: "Z shelter",
      address: "999 Felix Ave",
      city: "Cat Alley",
      state: "CA",
      zip: "67890"
    )
    shelter2 = Shelter.create(
      name: "A Shelter",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )


    visit "/shelters"

    # page.body(shelter1).should < page.body(shelter2)
    # expect(page) =~ /shelter1.*shelter2/
    # expect(@shelters.first).to eql(shelter1)
    # expect(@shelters.last).to eql(shelter2)
    # orderly gem?


  end


end
