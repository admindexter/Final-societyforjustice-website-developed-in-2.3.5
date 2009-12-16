class Guestbook < ActiveRecord::Base
  acts_as_textiled :comment
end

