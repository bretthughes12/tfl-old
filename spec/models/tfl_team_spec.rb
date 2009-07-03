require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TflTeam do
  before(:each) do
    @valid_attributes = {
      :name => "Vikings",
      :abbr => "VIK"
    }
  end

  it "should create a new instance given valid attributes" do
    TflTeam.create!(@valid_attributes)
  end
end
