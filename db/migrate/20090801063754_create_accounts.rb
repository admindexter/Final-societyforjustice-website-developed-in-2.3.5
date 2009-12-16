class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :ac_number
      t.string :location
      t.text :address
      t.text :description
      t.text :other_info

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
