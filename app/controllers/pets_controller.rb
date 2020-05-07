class PetsController < ApplicationController

  def index
    @shelters = Shelter.all

    if params[:adoptable] == "true"
      @pets = Pet.where(adoptable: true)
    elsif params[:adoptable] == "false"
      @pets = Pet.where(adoptable: false)
    elsif !params[:id].nil?
      @shelter = Shelter.find(params[:id])
      @pets = Pet.where(shelter_id: params[:id]).order(:adoptable).reverse_order
    else
      @pets = Pet.order(:adoptable).reverse_order
    end

  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = Pet.new({
      name: params[:name],
      image: params[:image],
      description: params[:description],
      age: params[:age],
      sex: params[:sex],
      adoptable: true,
      shelter_id: params[:id]

      })

      pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
    @shelter = Shelter.where(name: @pet.shelter)
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
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  def is_adoptable
    @pet = Pet.find(params[:id])
    @pet.update({
      adoptable: true
      })
    redirect_to "/pets/#{@pet.id}"
  end

  def is_pending
    @pet = Pet.find(params[:id])
    @pet.update({
      adoptable: false
      })
    redirect_to "/pets/#{@pet.id}"
  end


end
