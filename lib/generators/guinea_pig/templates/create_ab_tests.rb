class CreateAbTests < ActiveRecord::Migration
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

    add_index :ab_tests, [:guinea_pig_id, :guinea_pig_type, :experiment], :name => :index_ab_tests_on_guinea_pig_id_and_type_and_experiment
  end

  def self.down
    remove_index :ab_tests, :name => :index_ab_tests_on_guinea_pig_id_and_type_and_experiment
    drop_table :ab_tests
  end
end