class CreateABTests < ActiveRecord::Migration
  def self.up
    create_table :ab_tests do |t|
      t.string      :experiment, :null => false
      t.string      :alternative, :null => false
      t.integer     :guinea_pig_id, :null => false
      t.string      :guinea_pig_type, :null => false
      t.integer     :seen_count, :default => 0
      t.integer     :conversion_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :ab_tests
  end
end