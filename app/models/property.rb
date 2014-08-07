class Property < ActiveRecord::Base
has_attached_file :document
has_attached_file :image
validates_attachment :document
validates_attachment :image,  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },  :message  => "you can only upload pictures"
validates_attachment :document
validates_presence_of :location, :city, :description, :mobile
#validates_presence_of :type_of_land, :title, :price, :area, :person_type,:city, :location, :description, :name,
#  :email, :mobile, :electricity_type,:boundary_status,:drainage_status,:inleave_rode,:shed_status,:borewell_status, :land_status
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  acts_as_gmappable

    has_many :images , :dependent => :destroy
    
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
  
  
  def gmaps4rails_address
    "#{self.location}, #{self.city}"
  end
   def gmaps4rails_infowindow
    "<b>City:&nbsp;</b>#{self.city}<br /><b>Location:&nbsp;</b> #{self.location} "
  end
  
  
  
#def validate_on_create
#
#    dimensions = Paperclip::Geometry.from_file(self.image.queued_for_write[:original])
#    self.errors.add(:image, "Please upload a file at least 880 pixels wide") if dimensions.width < 90
#    self.errors.add(:image, "Please upload a file at least 390 pixels tall") if dimensions.height < 51
#end


  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
