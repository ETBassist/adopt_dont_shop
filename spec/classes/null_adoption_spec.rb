require './lib/assets/null_adoption'

RSpec.describe NullAdoption do
  before(:all) do
    @null_adoption = NullAdoption.new
  end

  it "exists" do
    expect(@null_adoption).to be_an_instance_of NullAdoption
  end

  it "returns adoptable status" do
    expect(@null_adoption.current_status).to eq("Adoptable")
  end

  it "returns a value for path switching" do
    expect(@null_adoption.path_switch).to eq("pending")
  end
end
