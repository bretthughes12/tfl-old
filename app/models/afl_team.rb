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

class AflTeam < ActiveRecord::Base
  has_many :players

  validates_presence_of     :abbr, :name
  validates_uniqueness_of   :abbr, :name
  validates_length_of       :abbr,           :in => 2..4
  validates_length_of       :name,           :maximum => 50

  def self.refresh_from_array(fields)
    afl_team = find_by_abbr(fields[2])
    if afl_team
      afl_team.name = fields[0]
      afl_team.save
    else
      create(:name => fields[0], 
             :abbr => fields[2])
    end
  end
end
