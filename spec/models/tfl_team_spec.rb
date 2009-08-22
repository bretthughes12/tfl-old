# == Schema Information
# Schema version: 20090822095040
#
# Table name: tfl_teams
#
#  id         :integer(4)      not null, primary key
#  name       :string(50)
#  abbr       :string(4)
#  created_at :datetime
#  updated_at :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TflTeam do
  before(:each) do
    @valid_attributes = {
      :name => "Vikings",
      :abbr => "VIK"
    }
    
    @valid_refresh_array = ["Victoria Vikings", "VIK"]
  end

  it "should create a new instance given valid attributes" do
    TflTeam.create!(@valid_attributes)
  end

  it "should create a new instance given a refresh from a valid array" do
    TflTeam.refresh_from_array(@valid_refresh_array)
  end

  it "should create update an existing instance given a refresh from a valid array" do
    TflTeam.create!(@valid_attributes)
    TflTeam.refresh_from_array(@valid_refresh_array)
    
    team = TflTeam.find_by_abbr("VIK")
    team.name.should == "Victoria Vikings"
  end
end
