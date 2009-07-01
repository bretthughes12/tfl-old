# == Schema Information
# Schema version: 20090630112715
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
  end

  it "should create a new instance given valid attributes" do
    AflTeam.create!(@valid_attributes)
  end
end
