class Gallery < ActiveRecord::Base
  has_attached_file :photo, :styles => { :thumbnail => "130x130>", :portrait => "150x150>", :medium => "180x180>", :preview => "492x492>" },
  					:url => "/assets/galleries/:id/:style/:basename.:extension",
  					:path => ":rails_root/public/assets/galleries/:id/:style/:basename.:extension"

  validates_uniqueness_of :title
  validates_presence_of :title
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 500.kilobytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
end