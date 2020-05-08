class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name

  def adoption_status
    return "Adoptable" if adoptable
    return "Pending" if !adoptable
  end

  def self.pet_list(params)

    if params[:adoptable] == "true"
      where(adoptable: true)
    elsif params[:adoptable] == "false"
      where(adoptable: false)
    elsif !params[:id].nil?
      where(shelter_id: params[:id]).order(:adoptable).reverse_order
    else
      order(:adoptable).reverse_order
    end
  end

end
