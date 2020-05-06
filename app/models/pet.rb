class Pet < ApplicationRecord

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

  def change_adoption
    return "Change to Adoptable" if !adoptable
    return "Change to Adoption Pending" if adoptable
  end

end
