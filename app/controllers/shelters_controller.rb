class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
    @pets = Pet.all

    if params[:alphabetical] == "true"
      @shelters = Shelter.order("lower(name)")
    elsif params[:num_pets] == "true"
      # @shelters = Shelter.order(:pets)
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
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def pets
    @shelter = Shelter.find(params[:id])
    @pets = Pet.where(shelter_id: params[:id]).order(:adoptable).reverse_order

    if params[:adoptable] == "true"
      @pets = @pets.where(adoptable: true)
    elsif params[:adoptable] == "false"
      @pets = @pets.where(adoptable: false)
    end

  end

end
