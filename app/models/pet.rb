class Pet < ApplicationRecord
  belongs_to :shelter

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

  def self.total_pets
    count
  end



end
