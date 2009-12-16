class AddTagToPress < ActiveRecord::Migration
  def self.up
    add_column :presses, :tag, :string
  end

  def self.down
    remove_column :presses, :tag
  end
end

