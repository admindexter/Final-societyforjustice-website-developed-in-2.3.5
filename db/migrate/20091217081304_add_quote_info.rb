class AddQuoteInfo < ActiveRecord::Migration
  def self.up
    Quote.delete_all

    Quote.create(
    :passage => "Isaiah 58:6",
    :content =>
    %{<p>
      To loose the bands of wickedness, to undo the heavy burdens,
      and to let the oppressed go free, and that ye break every yoke?</p>})
  end

  def self.down
    Quote.delete_all
  end
end

