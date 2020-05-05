class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new

  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
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
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      shelter.save
      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelters = Shelter.all
    shelters.destroy(params[:id])
    redirect_to '/shelters'
  end

  def pets
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all.find_all {|pet| pet.shelter == @shelter.name }
  end

end
