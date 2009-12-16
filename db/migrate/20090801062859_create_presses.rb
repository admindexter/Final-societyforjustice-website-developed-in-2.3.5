class CreatePresses < ActiveRecord::Migration
  def self.up
    create_table :presses do |t|
      t.string :title
      t.string :location
      t.datetime :date_of_event
      t.string :emphasis
      t.string :author
      t.text :information

      t.timestamps
    end
  end

  def self.down
    drop_table :presses
  end
end

