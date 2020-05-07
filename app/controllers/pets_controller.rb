class PetsController < ApplicationController

  def index
    # @pets = Pet.all
    @pets = Pet.adoptable_first
    @shelters = Shelter.all

    if params[:adoptable] == "true"
      @pets = @pets.find_all {|pet| pet.adoptable}
    elsif params[:adoptable] == "false"
      @pets = @pets.find_all {|pet| !pet.adoptable}
    end

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
      name: params[:name],
      image: params[:image],
      description: params[:description],
      age: params[:age],
      sex: params[:sex],
      adoptable: params[:adoptable]
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
binding.pry
    @pet = Pet.find(params[:id])
    @pet.update({
      adoptable: false
      # adoptable: false
      })

    redirect_to "/pets/#{@pet.id}"
  end

  def pending

    @pet = Pet.find(params[:id])
    @pet.update({
      adoptable: true
      # adoptable: true
      })
    redirect_to "/pets/#{@pet.id}"
  end


end
