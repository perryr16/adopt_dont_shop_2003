class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

  def self.adoptable_first
    all.sort_by {|pet| pet.adoptable ? 0 : 1}
  end

end
