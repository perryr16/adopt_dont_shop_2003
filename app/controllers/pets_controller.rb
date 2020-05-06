class PetsController < ApplicationController

  def index
    @pets = Pet.all
    @shelters = Shelter.all
    # {pet.shelter => shelter.id}
    @pet_shelter_id = Hash.new { |hash, key| hash[key] = 0 }
    @pets.each do |pet|
      shelter = @shelters.find {|shelter| shelter.name == pet.shelter}
      @pet_shelter_id[pet.shelter] = shelter.id
    end

  end

  def new
  end

  def create
    pet = Pet.new({
      name: params[:pet][:name],
      image: params[:pet][:image],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      shelter: params[:pet][:shelter],
      adoptable: params[:pet][:adoptable]
      })

      pet.save
      redirect_to '/pets'
  end

  def show
    @pet = Pet.find(params[:id])
    @shelter = Shelter.all.find {|shelter| shelter.name == @pet.shelter}

  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:pet][:name],
      image: params[:pet][:image],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      shelter: params[:pet][:shelter],
      adoptable: params[:pet][:adoptable]
      })

      pet.save
      redirect_to '/pets'
  end

  def destroy
    pets = Pet.all
    pets.destroy(params[:id])
    redirect_to '/pets'
  end


end
