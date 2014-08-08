class Image < ActiveRecord::Base
  
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :property
  validates_attachment_size(:image, :less_than => 5000.kilobytes)
end
