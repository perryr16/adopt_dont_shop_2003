class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
    @pets = Pet.all

    if params[:alphabetical] == "true"
      @shelters = @shelters.sort_by { |shelter| shelter.name}
    elsif params[:num_pets] == "true"
      @shelters = @shelters.sort_by {|shelter| shelter.pets.count}.reverse
    end
  end

  def new

  end

  def create
    shelter = Shelter.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })

      shelter.save
      redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })
      shelter.save
      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelters = Shelter.all
    shelters.destroy(params[:id])
    redirect_to '/shelters'
    #Shelter.destoy(params[:id])
  end

  def pets
    @shelter = Shelter.find(params[:id])
    all_pets = Pet.adoptable_first
    @pets = all_pets.find_all do |pet|
      pet.shelter_id == params[:id].to_i
    end

    if params[:adoptable] == "true"
      @pets = @pets.find_all {|pet| pet.adoptable}
    elsif params[:adoptable] == "false"
      @pets = @pets.find_all {|pet| !pet.adoptable}
    end
    # @pets = shelter_pets.find_all { |pet| pet.adoptable}
  end

  def new_pet
    @shelter = Shelter.find(params[:id])
  end

  def create_pet
    shelter = Shelter.find(params[:id])
    pet = Pet.new({
      name: params[:pet][:name],
      image: params[:pet][:image],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      # shelter_name: params[:pet][:shelter_name],
      adoptable: params[:pet][:adoptable],
      shelter_id: params[:id]

      })

      pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
  end


end
