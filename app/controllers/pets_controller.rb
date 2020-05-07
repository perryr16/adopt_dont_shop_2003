class PetsController < ApplicationController

  def index
    # @pets = Pet.all
    @pets = Pet.adoptable_first
    @shelters = Shelter.all

  end

  def new
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

  def adoptable
    @pet = Pet.find(params[:id])
    @pet.update({
      adoptable: params[:pet][:adoptable]
      # adoptable: false
      })
    redirect_to "/pets/#{@pet.id}"
  end

  def pending
    @pet = Pet.find(params[:id])
    @pet.update({
      adoptable: params[:pet][:adoptable]
      # adoptable: true
      })
    redirect_to "/pets/#{@pet.id}"
  end


end
