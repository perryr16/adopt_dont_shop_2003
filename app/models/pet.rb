class Pet < ApplicationRecord
  belongs_to :shelter

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end



end
