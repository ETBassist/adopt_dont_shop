require './lib/assets/null_adoption'

Rspec.describe NullAdoption do
  before(:all) do
    @null_adoption = NullAdoption.new
  end

  it "exists" do
    expect(@null_adoption).to be_an_instance_of NullAdoption
  end
end
