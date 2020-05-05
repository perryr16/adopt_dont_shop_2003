require 'rails_helper'

RSpec.describe "Pets can be seen on index ", type: :feature do
  it "can view a pet" do
    pet1 = Pet.create(
      name: "Walter",
      age: "4",
      sex: "male",
      shelter: "the lab",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/sealyham-terrier-small-dog.jpg"
    )

    visit "/pets"
    
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter)
    expect(page).to have_css("img[src*='https://thesmartcanine.com/wp-content/uploads/2019/09/sealyham-terrier-small-dog.jpg']")
  end

end
