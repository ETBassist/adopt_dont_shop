require 'rails_helper'

describe Pet, type: :model do
  describe "Relationships" do
    it { should belong_to :shelter }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
  end
end
