require 'rails_helper'

describe Pet, type: :model do
  describe "Relationships" do
    it { should belong_to :shelter }
  end
end
