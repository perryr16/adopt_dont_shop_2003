class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

  def self.pet_list(params)

    if params[:adoptable] == "true"
      @pets = Pet.where(adoptable: true)
    elsif params[:adoptable] == "false"
      @pets = Pet.where(adoptable: false)
    elsif !params[:id].nil?
      @pets = Pet.where(shelter_id: params[:id]).order(:adoptable).reverse_order
    else
      @pets = Pet.order(:adoptable).reverse_order
    end
  end

end
