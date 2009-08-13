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

class TflTeam < ActiveRecord::Base

  validates_presence_of     :abbr, :name
  validates_uniqueness_of   :abbr, :name
  validates_length_of       :abbr,           :in => 2..4
  validates_length_of       :name,           :maximum => 50

  def self.refresh_from_array(fields)
    tfl_team = find_by_abbr(fields[1])
    if tfl_team
      tfl_team.name = fields[0]
      tfl_team.save
    else
      create(:name => fields[0], 
             :abbr => fields[1])
    end
  end
end
