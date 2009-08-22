# == Schema Information
# Schema version: 20090822095040
#
# Table name: players
#
#  id             :integer(4)      not null, primary key
#  name           :string(50)
#  tfl_code       :string(10)
#  afl_team_id    :integer(4)
#  tfl_team_id    :integer(4)
#  keeper         :boolean(1)
#  rookie         :boolean(1)
#  category       :string(50)
#  alternate_name :string(50)
#  created_at     :datetime
#  updated_at     :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Player do
  before(:each) do
    @valid_attributes = {
      :name => "Elvis Presley",
      :tfl_code => "A1950N025",
      :afl_team_id => 1,
      :tfl_team_id => 1,
      :keeper => false,
      :rookie => false,
      :category => "Forward",
      :alternate_name => "Presley Elvis"
    }
    
    @valid_refresh_array = ["filler", "A1950N025", "filler", nil, nil, false, false, 
      false, "Defender", "filler", "filler", "filler", "filler", "Elvis Presley",
      "Presley Elvis"]
  end

  it "should create a new instance given valid attributes" do
    Player.create!(@valid_attributes)
  end

  it "should create a new instance given a refresh from a valid array" do
    Player.refresh_from_array(@valid_refresh_array)
  end

  it "should create update an existing instance given a refresh from a valid array" do
    Player.create!(@valid_attributes)
    Player.refresh_from_array(@valid_refresh_array)
    
    player = Player.find_by_tfl_code("A1950N025")
    player.category.should == "Defender"
  end
end
