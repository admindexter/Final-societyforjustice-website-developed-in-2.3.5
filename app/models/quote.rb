class Quote < ActiveRecord::Base
  acts_as_textiled :content
end

