require './lib/assets/pending_adoption'

RSpec.describe PendingAdoption do
  before :all do
    @pending_adoption = PendingAdoption.new
  end

  it "exists" do
    expect(@pending_adoption).to be_an_instance_of(PendingAdoption)
  end
end
