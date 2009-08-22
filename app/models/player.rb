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

class Player < ActiveRecord::Base
  belongs_to :afl_team
  belongs_to :tfl_team

  validates_presence_of     :tfl_code, :name, :category
  validates_uniqueness_of   :tfl_code
  validates_length_of       :tfl_code,       :maximum => 50
  validates_length_of       :name,           :maximum => 50
  validates_length_of       :alternate_name, :maximum => 50,  :allow_nil => true
  validates_length_of       :category,       :maximum => 50

  CATEGORIES = ["Forward", 
                "Defender", 
                "Onballer", 
                "Ruckman", 
                "Defensive Utility",
                "Forward Utility",
                "Ruckman Forward",
                "Rookie",
                "Unclassified"]

  validates_inclusion_of    :category,       :in => CATEGORIES,  
                            :message => "unknown category"

  def self.refresh_from_array(fields)
    player = find_by_tfl_code(fields[1])
    afl_team = AflTeam.find_by_name(fields[3])
    tfl_team = TflTeam.find_by_name(fields[4])
    if player
      player.name = fields[13]
      player.alternate_name = fields[14]
      player.keeper = fields[5]
      player.rookie = fields[7]
      player.category = fields[8]
      player.afl_team = afl_team unless afl_team.nil?
      player.tfl_team = tfl_team unless tfl_team.nil?
      player.save
    else
      create(:name => fields[13], 
             :tfl_code => fields[1],
             :alternate_name => fields[14],
             :keeper => fields[5],
             :rookie => fields[7],
             :category => fields[8],
             :afl_team => afl_team.nil? ? nil : afl_team,
             :tfl_team => tfl_team.nil? ? nil : tfl_team)
    end
  end
end
