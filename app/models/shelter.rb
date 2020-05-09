class Shelter < ApplicationRecord
  has_many :pets
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def self.shelter_list(params)
    if params[:alphabetical] == "true"
      order("lower(name)")
    elsif params[:num_pets] == "true"

      # @shelters = Shelter.joins(:pets).distinct
      # @pets = Pet.group(:shelter_id).count
      # x = Pet.group(:shelter).count
      # binding.pry
      all.sort_by {|shelter| shelter.pets.count}.reverse
      # x = Pet.group(:shelter).order(:shelter_id).reverse_order.count(:shelter_id)
      # x.keys
    else
      all
    end
  end
end
