# == Schema Information
# Schema version: 20090703095724
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
  end

  it "should create a new instance given valid attributes" do
    TflTeam.create!(@valid_attributes)
  end
end
