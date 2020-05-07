class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

end
