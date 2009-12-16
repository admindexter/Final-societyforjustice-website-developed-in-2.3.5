class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
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
    drop_table :articles
  end
end
