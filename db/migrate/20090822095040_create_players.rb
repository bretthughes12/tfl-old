class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name, :limit => 50
      t.string :tfl_code, :limit => 10
      t.integer :afl_team_id
      t.integer :tfl_team_id
      t.boolean :keeper
      t.boolean :rookie
      t.string :category, :limit => 50
      t.string :alternate_name, :limit => 50

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
