class Pet < ApplicationRecord

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

end
