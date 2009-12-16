class CreateGuestbooks < ActiveRecord::Migration
  def self.up
    create_table :guestbooks do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :guestbooks
  end
end
