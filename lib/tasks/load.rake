namespace :tfl do

  # require 'fastercsv'

  desc "Load the AFL teams reference table"
  task :load_afl_teams => ['db/data/afl_teams.csv', "db:migrate"] do |t|
    FasterCSV.foreach(t.prerequisites.first) do |row|
      AflTeam.refresh_from_array(row)
    end
  end

  desc "Load the TFL teams reference table"
  task :load_tfl_teams => ['db/data/tfl_teams.csv', "db:migrate"] do |t|
    FasterCSV.foreach(t.prerequisites.first) do |row|
      TflTeam.refresh_from_array(row)
    end
  end

end