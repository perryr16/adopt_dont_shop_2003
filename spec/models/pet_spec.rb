require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "can sort pets by adoption status" do
    shelter1 = Shelter.create(
      name: "the lab",
      address: "123 Dog Street",
      city: "Dog Town",
      state: "DO",
      zip: "12345"
    )
    pet1 = Pet.create(
      name: "Remy",
      description: "I'll be honest, he's a killer",
      age: "10",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id,
      adoptable: false
    )
    pet2 = Pet.create(
      name: "Doug",
      description: "was on nickelodeon",
      age: "9",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id,
      adoptable: true
    )
    pet3 = Pet.create(
      name: "Blue",
      description: "most beautiful of goldens",
      age: "2",
      sex: "female",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id,
      adoptable: false
    )
    pets = Pet.adoptable_first

    expect(pets.first).to eql(pet2)
  end


end
