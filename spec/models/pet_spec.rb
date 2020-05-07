require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validates values" do
    it {should validate_presence_of :name}

  end

  

  it "returns adoptable or pending" do
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
      adoptable: true
    )

    pet2 = Pet.create(
      name: "Abu",
      description: "not a theif",
      age: "22",
      sex: "male",
      image: "https://thesmartcanine.com/wp-content/uploads/2019/09/labrador-pitbull-mix.jpg",
      shelter_id: shelter1.id,
      adoptable: false
    )

    expect(pet1.adoption_status).to eq("Adoptable")
    expect(pet2.adoption_status).to eq("Pending")

  end


end
