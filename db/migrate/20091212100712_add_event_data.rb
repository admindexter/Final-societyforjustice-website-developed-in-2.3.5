class AddEventData < ActiveRecord::Migration
  def self.up
    Event.delete_all

    Event.create(
    :title => "INTERNATIONAL SOCIETY FOR SOCIAL JUSTICE AND HUMAN RIGHTS [ISSJHR] to honor GANI FAWEHINMI",
    :information =>
    %{<p>
      INTERNATIONAL SOCIETY FOR SOCIAL JUSTICE AND HUMAN RIGHTS [ISSJHR] to honor GANI FAWEHINMI.
      Date to be advised.</p>})
  end

  def self.down
    Event.delete_all
  end
end

