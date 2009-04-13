class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :boss1_id
      t.integer :boss2_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
