class Shelter < ApplicationRecord
  has_many :pets
  validates_presence_of :name

  def self.shelter_list(params)
    if params[:alphabetical] == "true"
      order("lower(name)")
    elsif params[:num_pets] == "true"
      # binding.pry
      # @shelters = Shelter.joins(:pets).distinct
      # @pets = Pet.group(:shelter_id).count
      all.sort_by {|shelter| shelter.pets.count}.reverse
    else
      all
    end
  end
end
