class CreateTflTeams < ActiveRecord::Migration
  def self.up
    create_table :tfl_teams do |t|
      t.string :name, :limit => 50
      t.string :abbr, :limit => 4

      t.timestamps
    end
  end

  def self.down
    drop_table :tfl_teams
  end
end
