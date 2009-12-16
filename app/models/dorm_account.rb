class DormAccount < ActiveRecord::Base
  acts_as_textiled :description, :other_info, :address
end

