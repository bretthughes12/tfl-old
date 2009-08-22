# == Schema Information
# Schema version: 20090822095040
#
# Table name: afl_teams
#
#  id         :integer(4)      not null, primary key
#  name       :string(50)
#  abbr       :string(4)
#  created_at :datetime
#  updated_at :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AflTeam do
  before(:each) do
    @valid_attributes = {
      :name => "Tasmania",
      :abbr => "TAS"
    }
    
    @valid_refresh_array = ["Tasmania Tigers", "filler", "TAS"]
  end

  it "should create a new instance given valid attributes" do
    AflTeam.create!(@valid_attributes)
  end

  it "should create a new instance given a refresh from a valid array" do
    AflTeam.refresh_from_array(@valid_refresh_array)
  end

  it "should create update an existing instance given a refresh from a valid array" do
    AflTeam.create!(@valid_attributes)
    AflTeam.refresh_from_array(@valid_refresh_array)
    
    team = AflTeam.find_by_abbr("TAS")
    team.name.should == "Tasmania Tigers"
  end
end
