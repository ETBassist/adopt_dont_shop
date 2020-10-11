class Pet < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :name
  serialize :adoption_status
end
