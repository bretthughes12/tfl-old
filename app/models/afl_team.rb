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

class AflTeam < ActiveRecord::Base
end
