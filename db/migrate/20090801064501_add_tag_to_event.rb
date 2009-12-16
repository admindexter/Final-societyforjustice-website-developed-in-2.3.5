class AddTagToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :tag, :string
  end

  def self.down
    remove_column :events, :tag
  end
end
