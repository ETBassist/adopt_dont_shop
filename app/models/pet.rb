class Pet < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :name, :adoption_status
  serialize :adoption_status

  def self.by_status
    Pet.order(:adoption_status)
  end

  def self.adoptable_only
    Pet.where("adoption_status like ?", "%NullAdoption%")
  end

  def self.pending_only
    Pet.where("adoption_status like ?", "%Pending%")
  end
end
