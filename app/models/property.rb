class Property < ActiveRecord::Base
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ['application/pdf']
  validates_presence_of :location, :city, :description, :mobile
  #validates_presence_of :type_of_land, :title, :price, :area, :person_type,:city, :location, :description, :name,
  #  :email, :mobile, :electricity_type,:boundary_status,:drainage_status,:inleave_rode,:shed_status,:borewell_status, :land_status
    after_validation :geocode
  # acts_as_gmappable :check_process=> false, :msg => "Errrrrrrror"
   has_many :images , :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
  
  geocoded_by :address

def address
  [location, city, state].compact.join(', ')
end  
  
  
def gmaps4rails_address
  "#{self.location}, #{self.city}"
end

  def gmaps4rails_infowindow
    "<b>City:&nbsp;</b>#{self.city}<br /><b>Location:&nbsp;</b> #{self.location} <br /><a href='/home/land1?id=#{self.id}' class='btn'>Property</a>"
  end
          
 
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
