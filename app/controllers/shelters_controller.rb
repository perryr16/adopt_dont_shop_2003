class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
    @pets = Pet.all

    if params[:alphabetical] == "true"
      @shelters = Shelter.order("lower(name)")
    elsif params[:num_pets] == "true"
      # binding.pry
      # @shelters = Shelter.joins(:pets).distinct
      # @pets = Pet.group(:shelter_id).count
      @shelters = @shelters.sort_by {|shelter| shelter.pets.count}.reverse
    end
  end

  def new

  end

  def create
    shelter = Shelter.create!(shelter_params)
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

    shelter.update!(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private

  def shelter_params
    params.permit(:name,
                  :address,
                  :city,
                  :state,
                  :zip)
  end

end
