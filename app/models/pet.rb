class Pet < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :name
  serialize :adoption_status

  def self.by_status
    Pet.all.sort_by { |pet| pet.adoption_status.current_status }
  end

  def self.adoptable_only
    Pet.all.select { |pet| pet.adoption_status.current_status == "Adoptable" }
  end
end
