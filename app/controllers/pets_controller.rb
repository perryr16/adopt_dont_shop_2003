class PetsController < ApplicationController

  def index
    @pets = Pet.all
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
      })

      pet.save
      redirect_to '/pets'
  end

  def show
    @pet = Pet.find(params[:id])
  end


end
