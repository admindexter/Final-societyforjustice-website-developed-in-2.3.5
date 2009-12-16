class Press < ActiveRecord::Base
  acts_as_textiled :information

  validates_uniqueness_of :title
  validates_presence_of :title, :information
end

